# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


def category
# Create 3 categories
  Category.create(name: "Robots guerriers")
  Category.create(name: "Robots ménagers")
  Category.create(name: "Sexbot")
end
# Create 20 random items
 #destroy all items first
def test_item
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
end

def warbot
  cat = Category.find_by(name: "Robots guerriers")
  new_item = Item.new(title: "Chewbacca", description: Faker::Lorem.paragraph(8), price: Faker::Number.decimal(3), image_url: "warbot_1_", category_id: cat.id)
  new_item.save
  new_item = Item.new(title: "Fighter", description: Faker::Lorem.paragraph(8), price: Faker::Number.decimal(3), image_url: "warbot_2_", category_id: cat.id)
  new_item.save
  new_item = Item.new(title: "Optimus Prime", description: Faker::Lorem.paragraph(8), price: Faker::Number.decimal(3), image_url: "warbot_3_", category_id: cat.id)
  new_item.save
  new_item = Item.new(title: "Army Robbot", description: Faker::Lorem.paragraph(8), price: Faker::Number.decimal(3), image_url: "warbot_4_", category_id: cat.id)
  new_item.save
  new_item = Item.new(title: "Terminator", description: Faker::Lorem.paragraph(8), price: Faker::Number.decimal(3), image_url: "warbot_5_", category_id: cat.id)
  new_item.save
end

def del_all_items
  Item.destroy_all
end

warbot
