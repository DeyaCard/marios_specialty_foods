require 'rails_helper'

describe "the add a review process" do
  it "adds a new review" do
    test_product = Product.new({name: "Tomatoe", cost: "2", country_of_origin: "Mexico"})
    test_product.save
    visit products_path
    click_on 'Tomatoe'
    click_on 'Add a review'
    
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
end