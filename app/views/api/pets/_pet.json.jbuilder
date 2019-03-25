json.pet_id pet["id"]["$t"]
json.pet_name pet["name"]["$t"]
json.pet_age pet["age"]["$t"]
json.pet_description pet["description"]["$t"]
json.pet_breeds pet["breeds"]["breed"]
json.pet_photo pet["media"]["photos"]["photo"][2]["$t"]
json.meme_url image_url("meme.jpg")


breeds = ''
if pet["breeds"]["breed"].kind_of?(Array)
  pet["breeds"]["breed"].each do |breed|
    breeds << breed["$t"] + " "
    @breed_list = breeds
  end
else
  @breed_list = pet["breeds"]["breed"]["$t"]
end

json.breed_list @breed_list