import React from 'react'

const ReviewTile = (props) => {
  let review = props.review

  let reviewDisplayArray = [`Overall: ${review.overall}`]

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

  let reviewDisplay = reviewDisplayArray.map((category) => {
    return(
      <p key={category}>
        {category}
      </p>
    )
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
    </div>
  )
}

export default ReviewTile