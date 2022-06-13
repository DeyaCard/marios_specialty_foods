Product.destroy_all
Review.destroy_all

50.times do |index|
  product = Product.create!(
    name: Faker::Food.ingredient, 
    cost: Faker::Number.decimal(2), 
    country_of_origin: Faker::Address.country
    )
    product.save
    5.times do |review_index|
      review = Review.create!(
      author: Faker::Name.name, 
      content_body: Faker::Lorem.characters(number: 250, min_alpha: 50), 
      rating: Faker::Number.between(from: 1, to: 5),
      product_id: product.id
      )
      review.save
    end
    
end
p "Created #{Product.count} products and #{Review.count} Review"
