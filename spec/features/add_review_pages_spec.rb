require 'rails_helper'

describe "the add a review process" do
  before :each do
    visit new_user_registration_path
    fill_in 'Email', with: 'tobin@soccer.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Sign up'
    User.find_by(email: "tobin@soccer.com").update!(admin: true)
    visit new_product_path
    product = Product.create({name: "Tomatoe", cost: 2, country_of_origin: "Mexico"})
    click_on "Add new product"
  end

  it "adds a new review" do
    test_product = Product.new({name: "Tomatoe", cost: "2", country_of_origin: "Mexico"})
    test_product.save
    visit products_path
    click_on 'Tomatoe'
    click_on 'Add a review' 
    fill_in 'Author', :with => "Ryan"   
    fill_in 'Rating', :with => "5"
    fill_in 'Content body', :with => "This product was really high quality. I would purchase again. It was gooooooooooood."
    click_on 'Create Review'
    expect(page).to have_content 'Thanks for the feedback!'
    expect(page).to have_content 'Tomatoe'
    expect(page).to have_content "This product was really high quality. I would purchase again. It was gooooooooooood."
  end

  it "gives an error when no name is entered" do
    test_product = Product.new({name: "Tomatoe", cost: "2", country_of_origin: "Mexico"})
    test_product.save
    visit products_path
    click_on 'Tomatoe'
    click_on 'Add a review' 
    fill_in 'Author', :with => ""   
    fill_in 'Rating', :with => "5"
    fill_in 'Content body', :with => "This product was really high quality. I would purchase again. It was gooooooooooood."
    click_on 'Create Review'
    expect(page).to have_content 'error'
  end
end