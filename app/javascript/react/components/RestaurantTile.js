import React from 'react'
import { Link } from 'react-router-dom'

const RestaurantTile = (props) => {
  return (
    <div className="tile cell small-12 medium-4 large-4">
      <Link to={`/restaurants/${props.restaurant.id}`}>
        <img className="tile-image" src={props.restaurant.picture_url}/>
      </Link>
      <div className="tile-text">{props.restaurant.name}</div>
    </div>
  )
}

export default RestaurantTile