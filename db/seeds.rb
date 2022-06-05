Products.destroy_all
Reviews.destroy_all

50.times do |index|
  products = Products.create!(name: Faker::Food.ingredient, cost: Faker::Number.decimal(2), country_of_origin: Faker::Address.country)
  products.save
    5.times do |index|
    Reviews.create!(author: Faker::Name.name, content_body: Faker::Lorem.characters(250), rating: Faker::Number.between(from: 1, to: 5))
    products_id: products.id
  end
end
p "Created #{Products.count} products and #{Review.count} reviews"
