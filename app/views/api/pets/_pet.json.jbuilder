
json.pet_id pet["id"]["$t"]
json.pet_name pet["name"]["$t"]
json.pet_age pet["age"]["$t"]
json.pet_description pet["description"]["$t"]
json.pet_breeds pet["breeds"]["breed"]#note there can be more than 1 breed
json.pet_photo pet["media"]["photos"]["photo"][2]["$t"]
json.meme_url image_url("meme.jpg")