import React, { useEffect, useState } from 'react'
import RestaurantShowTile from './RestaurantShowTile'

const RestaurantShowContainer = (props) => {  
  const [restaurant, setRestaurant] = useState({})
  const [reviews, setReviews] = useState([])

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
      setRestaurant(body)
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

  return (
    <div>
      <RestaurantShowTile 
        restaurant={restaurant}
        reviews={reviews}
      />
    </div>
  )
}

export default RestaurantShowContainer