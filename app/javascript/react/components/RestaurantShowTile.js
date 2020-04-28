import React from 'react'
import { Link } from 'react-router-dom'

import ReviewTile from './ReviewTile'

const RestaurantShowTile = (props) => {
  let reviewsArray = props.reviews.map((review) => {
    return(
      <ReviewTile
        key={review.id}
        review={review}
      />
    )
  })
  
  return (
    <div>
      <div className="tile-show">
        <img src={props.restaurant.picture_url} className="tile-image"/>
        <h1>{props.restaurant.name}</h1>
        <p>{props.restaurant.address}</p>
        <p>{props.restaurant.city}</p>
        <p>{props.restaurant.zip}</p>
        <Link to = "/restaurants">Back to Restaurants</Link>
      </div>
      <div className="tile-reviews">
        <h3>Reviews</h3>
        {reviewsArray}
      </div>
    </div>
  )
}

export default RestaurantShowTile