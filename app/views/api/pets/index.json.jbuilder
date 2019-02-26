json.array! @pets.each do |pet|
  json.partial! "pet.json.jbuilder",
    pet: pet
    #would be good to add in logic to get the large image where "@size" = "x" or "pn". Should add this to pet model I think

end

# json.pet_photo @pet_photo #note this gives me every pet's images per pet (as opposed to just that pet's images) bc of the loop in the controller



