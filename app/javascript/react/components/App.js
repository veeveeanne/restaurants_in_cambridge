import React from 'react'
import { BrowserRouter, Switch, Route } from 'react-router-dom'

import RestaurantIndexContainer from './RestaurantIndexContainer'
import RestaurantShowContainer from './RestaurantShowContainer'

export const App = (props) => {
  return (
    <div>
      <BrowserRouter>
        <Switch>
          <Route exact path='/' component={RestaurantIndexContainer} />
          <Route exact path='/restaurants' component={RestaurantIndexContainer} />
          <Route exact path='/restaurants/:id' component={RestaurantShowContainer} />
        </Switch>
      </BrowserRouter>
    </div>
  )
}

export default App
