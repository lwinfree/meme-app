json.array! @pets.each do |pet|
  json.partial! "pet.json.jbuilder",
      pet: pet
end







