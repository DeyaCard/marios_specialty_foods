require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit new_product_path
    click_link 'Add Product'
    fill_in 'Name', :with => 'Tomatoes'
    fill_in 'Cost', :with => '2.00'
    fill_in 'Origin', :with => 'Mexico'
    click_on 'Create Product'
    expect(page).to have_content 'Products'
  end

  it "gives an error when no name is entered" do
    visit new_product_path
    click_on 'Create Product'
    expect(page).to have_content 'error'
  end
end