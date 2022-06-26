require 'rails_helper'

describe "edits a product" do
  before :each do
    visit new_user_registration_path
    fill_in 'Email', with: 'tobin@soccer.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    User.find_by(email: "tobin@soccer.com").update!(admin: true)
  end

  it "updates a new product" do
    product = Product.create({name: "Tomatoes", cost: 2, country_of_origin: 'USA'})
    product.save
    visit products_path 
    click_on 'Tomatoes', match: :first
    click_on 'Edit'
    fill_in 'Name', :with => 'Mellon'
    fill_in 'Cost', :with => '4'
    select 'Mexico', :from => 'Country of origin'
    click_on 'Update Product'
    expect(page).to have_content "Product successfully updated!"
    expect(page).to have_content 'Mellon'
  end
end
