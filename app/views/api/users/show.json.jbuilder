json.partial! 'user.json.jbuilder',
  user: @user

json.favorites do
  json.array! @user.favorites, partial: "/api/favorites/favorite", as: :favorite
end
