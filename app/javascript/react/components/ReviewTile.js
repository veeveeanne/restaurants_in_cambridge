import React from 'react'

const ReviewTile = (props) => {
  let review = props.review
  let user = props.currentUser
  let votes = props.allVotes

  let reviewDisplayArray = [`Overall: ${review.overall}`]

  //create variables for category
  //only create paragraph tag
  // check to see if food is null, if it is null, then don't render p

  let food
  if (review.food) {
    food = <p>Food: review.food</p>
  }

  if (review.food !== null) {
    reviewDisplayArray.splice(1, 0, `Food: ${review.food}`)
  }

  if (review.service !== null) {
    reviewDisplayArray.splice(2, 0, `Service: ${review.service}`)
  }

  if (review.ambience !== null) {
    reviewDisplayArray.splice(3, 0, `Ambience: ${review.ambience}`)
  }

  if (review.price !== null) {
    reviewDisplayArray.splice(4, 0, `Price: ${review.price}`)
  }

  debugger
  let reviewDisplay = reviewDisplayArray.map((category) => {
    return(
      <p key={category}>
        {category}
      </p>
    )
  })

  const handleVoteClick = () => {
    let payload = {
      review_id: props.review.id,
      helpful: parseInt(event.target.id) 
    }
    props.handleVote(payload)
  }

  let upClassStyle = ""
  let downClassStyle = ""

  votes.forEach((vote) => {
    if (vote.review_id === review.id) {
      if (vote.user_id === user.id) {
        if (vote.helpful === 1) {
          upClassStyle = "selected"
        } else if (vote.helpful === 0) {
          downClassStyle = "selected"
        }
      }
    }
  })

  return(
    <div className="review-tile">
      <div className="flex-container">
        <div className="screen-name">
          {review.user_screen_name}
        </div>
        <div className="date">
          {review.formatted_date}
        </div>
      </div>
      <div className="ratings">
        {reviewDisplay}
      </div>
      <div className="review-body">
        {review.body}
      </div>
      <div className="helpful">
        Was this review helpful?
        <i onClick={handleVoteClick} className={`${upClassStyle} far fa-thumbs-up`} id="1"></i>
        <i onClick={handleVoteClick} className={`${downClassStyle} far fa-thumbs-down`} id="0"></i>
      </div>
    </div>
  )
}

export default ReviewTile