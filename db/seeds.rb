# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



# Create 20 random items
Item.destroy_all #destroy all items first
20.times do |i|
  new_item = Item.new
  new_item.title = "Item#{i}"
  new_item.description  = "This is a brief description for #{new_item.title}"
  new_item.price = Faker::Number.decimal(2)
  new_item.image_url = Faker::Avatar.image
  new_item.save
end
