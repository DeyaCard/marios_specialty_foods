require 'rails_helper'

describe "edits a product review" do
  before :each do
    visit new_user_registration_path
    fill_in 'Email', with: 'tobin@soccer.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    User.find_by(email: "tobin@soccer.com").update!(admin: true)
  end

  it "updates a products review" do
    product = Product.create({name: "Avocado", cost: 2, country_of_origin: 'USA'})
    review = Review.create({author: "Tobin", content_body: "This is an excellent product teh oushf oiuhsdf hiaoihsf f hfh fh fhdisod hofih hfi you fosuisfh hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hhuh uh uhh uhuh h!", rating: 5, product_id: product.id})
    visit products_path(product, review)
    click_on 'Avocado'
    save_and_open_page
    click_on "This is an excellent product teh oushf oiuhsdf hiaoihsf f hfh fh fhdisod hofih hfi you fosuisfh hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hhuh uh uhh uhuh h!"
    click_on "Edit review"
    fill_in 'Author', :with => 'Jodie'
    fill_in 'Rating', :with => '4'
    fill_in 'Content body', :with => 'This is an excellent product teh oushf oiuhsdf hiaoihsf f hfh fh fhdisod hofih hfi you fosuisfh hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hhuh uh uhh uhuh bad!'
    click_on 'Update Review'
    expect(page).to have_content "This is an excellent product teh oushf oiuhsdf hiaoihsf f hfh fh fhdisod hofih hfi you fosuisfh hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hu hhuh uh uhh uhuh bad!"
  end
end