# Cambridge Eats
A review site for restaurants in the city of Cambridge, MA  
Visit the deployed application [here](http://cambridge-eats.herokuapp.com/)

## Authors
- Aidan Harris
- James Hu
- Michael Watkins
- Vivian Wang

## Built With
- [Ruby on Rails](https://guides.rubyonrails.org/v5.2/)
- [React.js](https://reactjs.org/docs/getting-started.html)
- [PostgreSQL](https://www.postgresql.org/docs/12/index.html)

### Getting started:
The setup steps expect the following tools/versions:
- Ruby 2.6.5
- Rails 5.2.4.2
- PostgreSQL 12

###### Checkout the repository
```
git clone https://github.com/veeveeanne/restaurants_in_cambridge.git
```

###### Create and setup the database
```
bundle exec rake db:create
bundle exec rake db:setup
```

###### Run the test suite
```
bundle exec rspec
```

###### Start the Rails server and webpack-dev-server
```
bundle exec rails s
yarn run start
```
###### The application can be accessed via <http://localhost:3000>


[![Codeship Status for veeveeanne/restaurants_in_cambridge](https://app.codeship.com/projects/efd17370-661f-0138-6019-7e4f61b5b52a/status?branch=master)](https://app.codeship.com/projects/393614)
