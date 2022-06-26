require 'rails_helper'

describe "the add a product process" do
  before(:each) do
    visit new_user_registration_path
    fill_in 'Email', with: 'them@gmail.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    User.find_by(email: "them@gmail.com").update!(admin: true)
  end

  it "adds a new product" do
    # visit products_path
    # click_link 'Add new product'
    visit new_product_path
    fill_in 'Name', :with => 'tomatoes'
    fill_in 'Cost', :with => '2.00'
    select 'Mexico', :from => 'Country of origin'
    click_on 'Create Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Tomatoes'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'error'
  end

  it "deletes a product from the database" do
    visit new_product_path
    fill_in 'Name', :with => 'tomatoes'
    fill_in 'Cost', :with => '2.00'
    select 'Mexico', :from => 'Country of origin'
    click_on 'Create Product'
    click_on "Tomatoes"
    click_on "Delete"
    expect(page).to have_no_content "Tomatoes"
  end
  
end