user1 = User.create(email: "Usergotmail@gmail.com", password: "123456", screen_name: "User1")
user2 = User.create(email: "test@email.com", password: "abcdef", screen_name: "testUser")

restaurant1 = Restaurant.create(name: "Mr. Bartley", address: "1245 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02138", picture_url: "http://www.bu.edu/files/2012/02/h_12-4650-MRBBURGER-012.jpg")
restaurant2 = Restaurant.create(name: "Alden & Harlow", address: "40 Brattle Street", city: "Cambridge", state: "MA", zip: "02138", picture_url: "https://lh3.googleusercontent.com/p/AF1QipP7aYIv_U9Phmx_YgZIoJHWqkERZBhOA21_B3gY=s1600-w420-h280")
Restaurant.create(name: "The Mad Monkfish", address: "524 Massachusetts", city: "Cambridge", state: "MA", zip: "02139", picture_url: "https://images.happycow.net/venues/1024/73/99/hcmp73993_244001.jpeg")
Restaurant.create(name: "Veggie Galaxy", address: "450 Massachusetts Avenue", city: "Cambridge", state: "MA", zip: "02139", picture_url: "https://polishedblogger.files.wordpress.com/2017/10/img_0308-1.jpg")
Restaurant.create(name: "Yume Wo Katare", address: "1923 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://s3-media0.fl.yelpcdn.com/bphoto/dwLeSf7fW87GvqP6DOOPBA/o.jpg")
Restaurant.create(name: "Little Donkey", address: "505 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/little-donkey-cambridge?select=Tg-r7oYwBFNLzISUy96sMg")
Restaurant.create(name: "Toscanini's Ice Cream", address: "159 First St", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/toscaninis-ice-cream-cambridge-3?select=18WyCU1dVGBJjJe3YRhFqA")
Restaurant.create(name: "L.A. Burdick Handmade Chocolates", address: "52 Brattle St", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/l-a-burdick-handmade-chocolates-cambridge-5?select=3cLZoE_v67-cINw7B0_lNg")
Restaurant.create(name: "Café Luna", address: "612 Main St", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/caf%C3%A9-luna-cambridge-3?select=uePFhH050JMZh_72iAUMIQ")
Restaurant.create(name: "Cuchi Cuchi", address: "795 Main St", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/cuchi-cuchi-cambridge?select=9eCPe3irud298_vDgG3crQ")
Restaurant.create(name: "Russell House Tavern", address: "14 Jfk St", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://www.yelp.com/biz_photos/russell-house-tavern-cambridge?select=cBEMgqCPwJ5d9l7h1S8USg")
Restaurant.create(name: "Cafe Mami", address: "1815 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02140", picture_url: "https://s3-media0.fl.yelpcdn.com/bphoto/xtlAI4vG8LBkuUBuGOBf9g/o.jpg")
<<<<<<< HEAD
Restaurant.create(name: "Cafe Papi", address: "1815 Massachusetts Ave", city: "Cambridge", state: "MA", zip: "02140")

Review.create(overall: 2, food: 5, service: 1, price: 4, body: "Food was great but service was awful", restaurant: restaurant1, user: user1)
Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant1, user: user2)
Review.create(overall: 4, food: 4, service: 3, price: 3, body: "Great burgers here. Came here for a dinner with friends and had a great time.", restaurant: restaurant2, user: user2)
=======

review1 = Review.create(overall: 2, food: 5, service: 1, price: 4, body: "Food was great but service was awful", restaurant: restaurant1, user: user1)
Review.create(overall: 5, food: 5, service: 5, price: 4, ambience: 4, body: "The food and service were all wonderful. Loved the ambience too!", restaurant: restaurant1, user: user2)
Review.create(overall: 4, food: 4, service: 3, price: 3, body: "Great burgers here. Came here for a dinner with friends and had a great time.", restaurant: restaurant2, user: user2)

Vote.create(review: review1, user: user1, helpful: 1)
Vote.create(review: review1, user: user2, helpful: 0)
>>>>>>> 72876c6f3ea2ed57cdcec0e9a235343dabf0c915
