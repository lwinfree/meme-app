User.create!([
  {name: "Katrina", email: "katrina@gmail.com", zipcode: 79701, password_digest: "$2a$10$ixiySh.85e6YTm1gzSTARuYRIiQgrK6N/j9O2BPuEzfi4dMGyEHga"},
  {name: "Lilly", email: "lilly@gmail.com", zipcode: 97214, password_digest: "$2a$10$zoIT1edRsXnxFYvqzhgfnuYXf2RE24CPJ8fa5..K7DVf00SJhLRbS"},
  {name: "Robin", email: "robin@gmail.com", zipcode: 77441, password_digest: "$2a$10$Mr74s4DaHv7YTnEd5aU7de.yuhbnrD0IRUWes9xWJcYKTvcvp4GGC"},
  {name: "Diane", email: "diane@gmail.com", zipcode: 77092, password_digest: "$2a$10$f8rsS2PNDhMAoB6mXZGTeOwa5vtBPlSt3w81Wom9t0lK4c54tF3R2"},
  {name: "David", email: "david@gmail.com", zipcode: 02110, password_digest: "$2a$10$O2LnVN8dF/qMjgApdve0KOo7QhjPPH3BDwve/534rRnzMJ5NyQEB."},
  {name: "Chris", email: "chris@gmail.com", zipcode: 97214, password_digest: "$2a$10$ypkYKBJ1wor4ojXw8fEtEukwGnpfbFznd8TkPdITtMpyOuQofTKSy"}
])

Favorite.create!([
  {petfinder_id: 43801171, user_id: 2}
])