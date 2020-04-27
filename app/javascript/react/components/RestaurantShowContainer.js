import React, { useEffect, useState } from 'react'
import { Redirect } from 'react-router-dom'

import RestaurantShowTile from './RestaurantShowTile'

const RestaurantShowContainer = (props) => {
  const [restaurant, setRestaurant] = useState({})
  const [reviews, setReviews] = useState([])
  const [currentUser, setCurrentUser] = useState({})
  const [redirect, shouldRedirect] = useState(false)

  useEffect(() => {
    fetch_restaurant_data()
    fetch_reviews_for_restaurant()
  }, [])

  const fetch_restaurant_data = () => {
    let id = props.match.params.id
    fetch(`/api/v1/restaurants/${id}`)
    .then((response) => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        let error = new Error(errorMessage)
        throw(error)
      }
    })
    .then((response) => {
      return response.json()
    })
    .then((body) => {
      setCurrentUser(body["user"])
      setRestaurant(body["restaurant"])
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  const fetch_reviews_for_restaurant = () => {
    let id = props.match.params.id
    fetch(`/api/v1/restaurants/${id}/reviews`)
    .then((response) => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        let error = new Error(errorMessage)
        throw(error)
      }
    })
    .then((response) => {
      return response.json()
    })
    .then((body) => {
      let array = body.reviews
      setReviews(array)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }

  const confirmDelete = () => {
    let confirmMessage = confirm("Do you want to delete this item?")
    if (confirmMessage === true) {
      deletePost()
    }
  }

  const deletePost = () => {
    let id = props.match.params.id
    fetch(`/api/v1/restaurants/${id}`, {
      credentials: "same-origin",
      method: "DELETE",
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      }
    })
    .then(() => {
      shouldRedirect(true)
    })
  }

  if (redirect) {
    return <Redirect to='/' />
  }

  let deleteButton
  if (currentUser) {
    if (currentUser.role === "admin") {
      deleteButton = (
        <button className="button" onClick={confirmDelete}>Delete</button>
      )
    } else {
      deleteButton = ""
    }
  }

  return (
    <div>
      {deleteButton}
      <RestaurantShowTile
        restaurant={restaurant}
        reviews={reviews}
      />
    </div>
  )
}

export default RestaurantShowContainer
