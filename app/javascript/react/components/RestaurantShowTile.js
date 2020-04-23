import React from 'react'
import { Link } from 'react-router-dom'

const RestaurantShowTile = (props) => {
  return (
    <div className="tile-show">
      <img src={props.restaurant.picture_url}/>
      <h1>{props.restaurant.name}</h1>
      <p>{props.restaurant.address}</p>
      <p>{props.restaurant.city}</p>
      <p>{props.restaurant.zip}</p>
      <Link to = "/restaurants">Back to Restaurants</Link>
    </div>
  )
}

export default RestaurantShowTile