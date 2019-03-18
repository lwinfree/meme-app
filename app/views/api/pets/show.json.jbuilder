json.partial! "pet.json.jbuilder",
  pet: @pet

json.pet_id @pet["id"]["$t"]
json.pet_size @pet["size"]["$t"]
json.pet_sex @pet["sex"]["$t"]
json.pet_description @pet["description"]["$t"]
# json.pet_photo @pet["media"]["photos"]["photo"][2]["$t"]

json.meme_url image_url("meme.jpg")

if @favorite
  json.favorite true
else
  json.favorite false
end
