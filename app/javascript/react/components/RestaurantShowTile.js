import React from 'react'
import { Link } from 'react-router-dom'

import ReviewTile from './ReviewTile'
import ReviewFormTile from './ReviewFormTile'

const RestaurantShowTile = (props) => {
  let addNewReview = props.addNewReview
  let currentUser = props.currentUser
  let reviewsArray = props.reviews.map((review) => {
    let review_vote
    if (props.current_user_votes && props.current_user_votes.length > 0) {
      props.current_user_votes.forEach((vote) => {
        if (vote.review_id === review.id) {
          review_vote = vote
        }
      })
    }

    return(
      <ReviewTile
        key={review.id}
        review={review}
        currentUser={props.currentUser}
        handleVote={props.handleVote}
        vote={review_vote}
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
        <ReviewFormTile
          currentUser={currentUser}
          addNewReview={addNewReview}
        />
        <div>
          {reviewsArray}
        </div>
      </div>
    </div>
  )
}

export default RestaurantShowTile
