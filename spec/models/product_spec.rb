require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :country_of_origin }

  it("will titleize the name of a product") do
    product = Product.create({name: "tomatoes", cost: 2, country_of_origin: "Mexico"})      
    expect(product.name()).to(eq("Tomatoes"))
  end
end


