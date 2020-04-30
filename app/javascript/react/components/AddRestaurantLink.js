import React from 'react'

const AddRestaurantLink = (props) => {
  return (
    <div className="tile cell small-12 medium-4 large-4">
      <a href="/restaurants/new">
        <img className="tile-image" src="https://www.crosstimbersgazette.com/crosstimbersgazette/wp-content/uploads/2016/02/restaurant-generic.jpg"/>
      <div className="tile-text">Add a Restaurant</div>
      </a>
    </div>
  )
}

export default AddRestaurantLink