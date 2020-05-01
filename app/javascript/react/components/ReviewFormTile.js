import React, { useState } from 'react'
import _ from 'lodash'

import ErrorList from './ErrorList'

const ReviewFormTile = (props) => {
  const [newReview, setNewReview] = useState({
    overall: "",
    food: "",
    ambience: "",
    service: "",
    price: "",
    body: ""
  })
  const [ errors, setErrors ] = useState({})

  const handleChange = (event) => {
    setNewReview({
      ...newReview,
      [event.currentTarget.name]:
      event.currentTarget.value
    })
  }

  const validateForm = () => {
    let submitErrors = {}
    const requiredFields = ["overall", "body"]
    requiredFields.forEach((field) => {
      if (newReview[field].trim() === "") {
        submitErrors = {
          ...submitErrors,
          [field]: 'must be filled in'
        }
      }
    })
    setErrors(submitErrors)
    return _.isEmpty(submitErrors)
  }

  const handleSubmit = (event) => {
    event.preventDefault()
    if (validateForm()) {
      props.addNewReview(newReview)
      setNewReview({
        overall: "",
        food: "",
        ambience: "",
        service: "",
        price: "",
        body: ""
      })
    }
  }

  return(
    <form onSubmit={handleSubmit}>
      <ErrorList errors={errors} />
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
      <label htmlFor="price">Price
        <input
          type="text"
          name="price"
          id="price"
          value={newReview.price}
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
}

export default ReviewFormTile
