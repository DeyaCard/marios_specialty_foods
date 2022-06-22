require 'rails_helper'

describe "edits a product" do
  before :each do
    Product.destroy_all
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
