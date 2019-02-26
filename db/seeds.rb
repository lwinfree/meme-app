# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
  {name: 'Lilly', email: 'lillywinfree@gmail.com', zipcode: 97214, password_digest: ''},
  {name: 'Anon', email: 'anon@gmail.com', zipcode: 78704, password_digest: ''},
  {name: 'Tester', email: 'tester@gmail.com', zipcode: 02210, password_digest: ''}
])

favorites = Favorite.create([
  {petfinder_id: 43801171, user_id: 1},
  {petfinder_id: 43768256, user_id: 1},
  {petfinder_id: 43476959, user_id: 1},
  {petfinder_id: 22422376, user_id: 2},
  {petfinder_id: 24402008, user_id: 2},
  {petfinder_id: 27514226, user_id: 2},
  {petfinder_id: 43991314, user_id: 3},
  {petfinder_id: 44007470, user_id: 3},
])
