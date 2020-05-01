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

  let ratings = [1, 2, 3, 4, 5]

  let optionValues = ratings.map((number) => {
    return(
      <option key={number}>
        {number}
      </option>
    )
  })

  const handleChange = (event) => {
    setNewReview({
      ...newReview,
      [event.currentTarget.id]:
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
  if (props.currentUser) {
    return(
      <form onSubmit={handleSubmit}>
        <ErrorList errors={errors} />
        <label htmlFor="overall">Overall
          <select id="overall" value={newReview.overall} onChange={handleChange}>
            <option></option>
            {optionValues}
          </select>
        </label>
        <label htmlFor="food">Food
          <select id="food" value={newReview.food} onChange={handleChange}>
              <option></option>
              {optionValues}
            </select>
        </label>
        <label htmlFor="ambience">Ambience
        <select id="ambience" value={newReview.ambience} onChange={handleChange}>
            <option></option>
            {optionValues}
          </select>
        </label>
        <label htmlFor="service">Service
        <select id="service" value={newReview.service} onChange={handleChange}>
            <option></option>
            {optionValues}
          </select>
        </label>
        <label htmlFor="price">Price
        <select id="price" value={newReview.price} onChange={handleChange}>
            <option></option>
            {optionValues}
          </select>
        </label>
        <label htmlFor="body">Body
          <textarea
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
}

export default ReviewFormTile
