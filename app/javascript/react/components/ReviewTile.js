import React from 'react'

const ReviewTile = (props) => {
  let review = props.review
  let user = props.currentUser
  let vote = props.vote

  let overall = <p>{`Overall: ${review.overall}`}</p>

  let food
  if (review.food) {
    food = <p>{`Food: ${review.food}`}</p>
  }

  let service
  if (review.service) {
    service = <p>{`Service: ${review.service}`}</p>
  }

  let ambience
  if (review.ambience) {
    ambience = <p>{`Ambience: ${review.ambience}`}</p>
  }

  let price
  if (review.price) {
    price = <p>{`Price: ${review.price}`}</p>
  }

  const handleVoteClick = () => {
    if (user) {
      let payload = {
        review_id: props.review.id,
        helpful: parseInt(event.target.id)
      }
      props.handleVote(payload)
    }
  }

  let upClassStyle = ""
  let downClassStyle = ""

  if (vote) {
    if (vote.helpful === 1) {
      upClassStyle = "selected"
    } else if (vote.helpful === 0) {
      downClassStyle = "selected"
    }
  }

  let helpful_display = ""
  if (review.total_votes > 1) {
    helpful_display = `${review.total_votes} people have found this review helpful`
  } else if (review.total_votes === 1) {
    helpful_display = `${review.total_votes} person has found this review helpful`
  }

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
        {overall}
        {food}
        {service}
        {ambience}
        {price}
      </div>
      <div className="review-body">
        {review.body}
      </div>
      <div className="helpful">
        Was this review helpful?
        <i onClick={handleVoteClick} className={`${upClassStyle} far fa-thumbs-up`} id="1"></i>
        <i onClick={handleVoteClick} className={`${downClassStyle} far fa-thumbs-down`} id="0"></i>
        <div>{helpful_display}</div>
      </div>
    </div>
  )
}

export default ReviewTile