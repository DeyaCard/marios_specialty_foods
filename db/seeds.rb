Product.destroy_all
Review.destroy_all
User.destroy_all

50.times do |index|
  product = Product.create!(
    name: Faker::Food.ingredient, 
    cost: Faker::Number.between(from: 1, to: 10), 
    country_of_origin: Faker::Address.country
    )
    product.save
    5.times do |review_index|
      review = Review.create!(
      author: Faker::Name.name, 
      content_body: Faker::Hipster.paragraph_by_chars(characters: 250, supplemental: false), 
      rating: Faker::Number.between(from: 1, to: 5),
      product_id: product.id
      )
      review.save
    end
    
end
p "Created #{Product.count} products"  
p "Created #{Review.count} reviews"


