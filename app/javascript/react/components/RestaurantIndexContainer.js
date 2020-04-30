import React, { useState, useEffect } from 'react'

import RestaurantTile from './RestaurantTile'

const RestaurantIndexContainer = props => {
  const [ restaurants, setRestaurants ] = useState([])
  useEffect(() => {
    fetch('/api/v1/restaurants')
    .then((response) => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`,
          error = new Error(errorMessage);
        throw(error);
      }
    })
    .then((response) => {
        return response.json()
    })
    .then((body) => {
      setRestaurants(body)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  let restaurantArray = restaurants.map((restaurant) => {
    return(
      <RestaurantTile key={restaurant.id} restaurant={restaurant} />
    )
  })

  return(
    <div className="grid-container">
      <div className="tile-container grid-x grid-margin-x">
          {restaurantArray}
      </div>
      <a className="add" href="/restaurants/new">Add a new restaurant</a>
    </div>
  )
}

export default RestaurantIndexContainer