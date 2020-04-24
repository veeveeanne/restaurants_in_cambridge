import React from 'react'

const RestaurantTile = (props) => {
  return (
    <div className="tile cell small-12 medium-4 large-4">
      <img className="tile-image" src={props.restaurant.picture_url}/>
      <div className="tile-text">{props.restaurant.name}</div>
    </div>
  )
}

export default RestaurantTile