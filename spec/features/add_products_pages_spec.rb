require 'rails_helper'

describe "the add a product process" do
  it "adds a new product" do
    visit products_path
    click_link 'Add new product'
    fill_in 'Name', :with => 'Tomatoes'
    fill_in 'Cost', :with => 2
    click_on 'Add Product'
    expect(page).to have_content 'Product successfully added!'
    expect(page).to have_content 'Tomatoes'
  end

  it "gives an error when no name is entered" do
    visit new_album_path
    click_on 'Add Product'
    expect(page).to have_content "Name can't be blank"
  end
end