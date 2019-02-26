json.partial! "pet.json.jbuilder",
  pet: @pet

json.pet_id @pet["id"]["$t"]
json.pet_size @pet["size"]["$t"]
json.pet_sex @pet["sex"]["$t"]
json.pet_description @pet["description"]["$t"]
