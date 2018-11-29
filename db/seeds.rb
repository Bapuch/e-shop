# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all
Category.destroy_all


# Create 3 categories

Category.create(name: "Robots guerriers")
Category.create(name: "Robots ménagers")
Category.create(name: "Sexbot")
# Create 20 random items
 #destroy all items first
20.times do |i|
  new_item = Item.new
  new_item.title = Faker::Name.name
  new_item.description  = Faker::Lorem.paragraph(8)
  new_item.price = Faker::Number.decimal(2)
  new_item.image_url = Faker::Avatar.image
  # temporaly, add item to first category
  new_item.category_id = Category.first.id
  new_item.save
end
