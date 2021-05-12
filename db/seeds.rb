# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# Create the categories

["Produce", "Dairy", "Bakery", "Deli"].each do |title|
  Category.create(title: title)
end

# Create products for the categories
prices = [12.3, 13.9, 16.0, 8.0, 4.4, 8.9, 9.99, 11.0]

["Broccoli", "Lettuce", "Carrots", "Bananas", "Apples", "Grapes", "Oranges", "Watermelon", "Squash", "Peppers", "Potatos"].each do |produce_type|
  cat = Category.find_by(title: "Produce")
  Product.create(title: produce_type, description: produce_type, price: prices.sample, category: cat)
end

["Milk", "Cheese", "Butter", "Buttermilk", "Eggs", "Heavy Cream", "Almond Milk"].each do |dairy_type|
  cat = Category.find_by(title: "Dairy")
  Product.create(title: dairy_type, description: dairy_type, price: prices.sample, category: cat)
end

["Rolls", "Cookies", "Cake", "Bread", "French Loaf", "Cupcakes", "Doughnuts", "Bagles"].each do |bakery_type|
  cat = Category.find_by(title: "Bakery")
  Product.create(title: bakery_type, description: bakery_type, price: prices.sample, category: cat)
end

["Sliced Ham", "Sliced Chicken", "Sliced Turkey", "Sliced Cheddar Cheese", "Sliced Pepperjack Cheese", "Sliced Provolone Cheese", "Sliced Swiss Cheese"].each do |deli_type|
  cat = Category.find_by(title: "Deli")
  Product.create(title: deli_type, description: deli_type, price: prices.sample, category: cat)
end
