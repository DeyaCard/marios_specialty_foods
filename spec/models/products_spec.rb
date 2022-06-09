require 'rails_helper'

describe Products do
  it { should validate_presence_of :name }
  it { should validate_presnce_of :cost }
  it { should validate_presence_of :origin }
  it { should have_many(:review) }
end

describe Products do 
  it("will titleize the name of a product") do
    products = Products.create({name: "tomatoes", cost: 3, country_of_origin: "mexico"})      
    expect(products.name()).to(eq("Tomatoes"))
  end
end
