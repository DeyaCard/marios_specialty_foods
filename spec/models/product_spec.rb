require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }
  it { should validate_presence_of :name }
  it { should validate_presence_of :cost }
  it { should validate_presence_of :origin }

  it("will titleize the name of a product") do
    product = Product.create({name: "tomatoes", cost: 3, country_of_origin: "mexico"})      
    expect(product.name()).to(eq("Tomatoes"))
  end
end


