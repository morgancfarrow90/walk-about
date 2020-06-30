# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
landscapes =Category.create([{name: 'Landscape Architecture'}])
statues =Category.create([{name: 'Statue'}])
hh =Category.create([{name: 'Happy Hour'}])

me= User.create([{username: 'morgan', password: 'morgan', email: 'morgan@aol.com', admin: true}])
brad= User.create([{username: 'brad', password: 'brad', email: 'brad@aol.com'}])

cg= Activity.create([{category_id: 3, name: 'Cheff Geoffs', address: '123 Main St', city: 'Washington', state: 'DC', zipcode: '20016', description: 'All day happy hour on Monday and Tuesday, closes at 9pm, drink and food specials', user_id: 1}])
mhp= Activity.create([{category_id: 1, name: 'Merridean Hill Park', address: '123 Main St', city: 'Washington', state: 'DC', zipcode: '20016', description: 'Historic Park with largest fountain in USA', user_id: 2}])

com= Comment.create([{user_id: 1, activity_id: 1, comment: 'Great food, Great burgers'}])
comm= Comment.create([{user_id: 2, activity_id: 2, comment: 'Fountain is not running'}])
comment= Comment.create([{user_id: 2, activity_id: 1, comment: 'Try the pizza and sit outside'}])
