Product.destroy_all
Review.destroy_all

50.times do
  product = Product.create!(
    name: Faker::Food.ingredient, 
    cost: Faker::Number.decimal(2), 
    country_of_origin: Faker::Address.country
    )
    5.times do
      Review.create!(
      author: Faker::Name.name, 
      content_of_body: Faker::Lorem.characters(250), 
      rating: Faker::Number.between(1, 5),
      product_id: product.id
      )
    end
    
end
p "Created #{Product.count} products and #{Review.count} Review"
