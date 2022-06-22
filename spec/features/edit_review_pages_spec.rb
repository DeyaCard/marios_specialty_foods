require 'rails_helper'

describe "edits a product review" do
  before :each do
    product = Product.create({name: "Tomatoes", cost: 2, country_of_origin: 'USA'})
    review = Review.create({author: "Tobin", content_body: "This is an excellent product!", rating: 5, product_id: product.id})
    visit products_path(product, review)
    click_on 'Edit review'
    fill_in 'Author', :with => 'Jodie'
    fill_in 'Rating', :with => '4'
    fill_in 'Content body', :with => 'Not as great as I was hoping.'
    click_on 'Update Review'
    expect(page).to have_content "Jodie"
  end
end