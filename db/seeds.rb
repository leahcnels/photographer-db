# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

category_list = [
  "Headshots",
  "Wedding",
  "Family",
  "School",
  "Sports"
]

category_list.each do |name|
  Category.create(name: name)
end

photographer_list = [
  ["Leah Nelson", "Portland, OR", "(206)715-7537", "leahcnels@gmail.com", 4],
]

photographer_list.each do |name, address, phone, email, category_id|
  Photographer.create(name: name, address: address, phone: phone, email: email, category_ids:[category_id])
end
