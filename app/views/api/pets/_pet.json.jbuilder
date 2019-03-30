json.pet_id pet["id"]["$t"]
json.pet_name pet["name"]["$t"]
json.pet_age pet["age"]["$t"]
json.pet_description pet["description"]["$t"]
json.pet_breeds pet["breeds"]["breed"]
json.pet_photo pet["media"]["photos"]["photo"][2]["$t"]


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



@age_sort = 0
if pet["age"]["$t"] == "Adult"
  @age_sort = 3
elsif pet["age"]["$t"] == "Baby"
  @age_sort = 1
elsif pet["age"]["$t"] == "Senior"
  @age_sort = 4
elsif pet["age"]["$t"] == "Young"
  @age_sort = 2
end

json.age_sort @age_sort


image = pet["media"]["photos"]["photo"][2]["$t"]
dog = ImageList.new(image)
texts = ['wow', 'such woofer', 'smol boi', 'floofer', 'many doge', 'much love', 'sub woofer', 'amaze', 'needz', 'goob', 'pupper', 'cloud', 'chonk', 'woof', 'bork', '14/10']
colors = ['gold', 'white', 'green', 'grey', 'purple', 'cyan', 'fuchsia', 'indigo', 'lime', 'maroon', 'orange', 'orchid', 'red', 'teal']
positions = [Magick::NorthWestGravity, Magick::EastGravity, Magick::SouthWestGravity]
x = 0
y = 0
text = Magick::Draw.new
text.font_family = 'NewCenturySchlbk'
text.pointsize = 50

positions.each do |position|
  x = rand(0..10)
  y = rand(0..13)
  text.gravity = position
  text.annotate(dog, 0,0,0,0, texts[x]) {
    self.fill = colors[y]        }
  y = rand(0..13)
end
@meme = dog.write("app/assets/images/meme.jpg")

# json.meme_url image_url("meme.jpg")