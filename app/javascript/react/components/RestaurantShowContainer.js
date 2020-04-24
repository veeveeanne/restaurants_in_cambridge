import React, { useEffect, useState } from 'react'
import { Redirect } from 'react-router-dom'

import RestaurantShowTile from './RestaurantShowTile'

const RestaurantShowContainer = (props) => {  
  const [restaurant, setRestaurant] = useState({})

  useEffect(() => {
    let id = props.match.params.id
    fetch(`/api/v1/restaurants/${id}`)
    .then((response) => {
      if (response.ok) {
        return response
      } else {
        let errorMessage = `${response.status} (${response.statusText})`
        let error = new Error(errorMessage);
        throw(error);
      }
    })
    .then((response) => {
      return response.json()
    })
    .then((body) => {
      setRestaurant(body)
    })
    .catch(error => console.error(`Error in fetch: ${error.message}`))
  }, [])

  const deletePost = () => {
    let id = props.match.params.id
    fetch(`/api/v1/restaurants/${id}`, {
      credentials: "same-origin",
      method: "DELETE"
    })
    .done();
  }
  
  return (
    <div>
      <RestaurantShowTile restaurant={restaurant} />
      <button onClick={deletePost}>Delete</button>
    </div>
  )
}

export default RestaurantShowContainer