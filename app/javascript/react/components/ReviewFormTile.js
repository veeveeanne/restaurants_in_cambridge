import React, { useState } from 'react'

const ReviewFormTile = (props) => {

  const [newReview, setNewReview] = useState({
    overall: "",
    food: "",
    ambience: "",
    service: "",
    body: ""
  })

  const handleChange = (event) => {
    setNewReview({
      ...newReview,
      [event.currentTarget.name]:
      event.currentTarget.value
    })
  }

  const handleSubmit = (event) => {
    event.preventDefault()
    props.addNewReview(newReview)
    setNewReview({
      overall: "",
      food: "",
      ambience: "",
      service: "",
      body: ""
    })
  }
  if (props.currentUser) {
    return(
      <form onSubmit={handleSubmit}>
        <label htmlFor="overall">Overall
          <input
            type="text"
            name="overall"
            id="overall"
            value={newReview.overall}
            onChange={handleChange}
          />
        </label>
        <label htmlFor="food">Food
          <input
            type="text"
            name="food"
            id="food"
            value={newReview.food}
            onChange={handleChange}
          />
        </label>
        <label htmlFor="ambience">Ambience
          <input
            type="text"
            name="ambience"
            id="ambience"
            value={newReview.ambience}
            onChange={handleChange}
          />
        </label>
        <label htmlFor="service">Service
          <input
            type="text"
            name="service"
            id="service"
            value={newReview.service}
            onChange={handleChange}
          />
        </label>
        <label htmlFor="body">Body
          <input
            type="text"
            name="body"
            id="body"
            value={newReview.body}
            onChange={handleChange}
          />
        </label>
        <input
          type="submit" value="Submit"
        />
      </form>
    )
  } else {
    return (
      <div>
        Please sign in to create a review
      </div>
    )
  }
}

export default ReviewFormTile