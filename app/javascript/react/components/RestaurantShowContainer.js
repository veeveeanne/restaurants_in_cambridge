import React, { useEffect, useState } from 'react'
import { Redirect } from 'react-router-dom'

import RestaurantShowTile from './RestaurantShowTile'

const RestaurantShowContainer = (props) => {
  const [restaurant, setRestaurant] = useState({})
  const [reviews, setReviews] = useState([])
  const [currentUser, setCurrentUser] = useState({})
  const [redirect, shouldRedirect] = useState(false)
  const [allVotes, setAllVotes] = useState([])

  useEffect(() => {
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
      setRestaurant(body["restaurant"]["restaurant"])
      setReviews(body["restaurant"]["restaurant"]["reviews"])
      setAllVotes(body["votes"])
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

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

  const handleVote = (votePayload) => {
    fetch(`/api/v1/votes`, {
      credentials: "same-origin",
      method: "POST",
      headers: {
        "Content-type": "application/json",
        "Accept": "application/json"
      },
      body: JSON.stringify(votePayload)
    })
    .then((response) => response.json())
    .then((body) => {
      setAllVotes([
        ...allVotes,
        body
      ])
    })
  }

  return (
    <div>
      {deleteButton}
      <RestaurantShowTile
        restaurant={restaurant}
        reviews={reviews}
        currentUser={currentUser}
        handleVote={handleVote}
        allVotes={allVotes}
      />
    </div>
  )
}

export default RestaurantShowContainer
