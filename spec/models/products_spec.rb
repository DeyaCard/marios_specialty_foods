require 'rails_helper'

describe Products do
  it { should have_many(:reviews) }
end

describe Products do
  it("has many reviews") do
    products = Products.create(name: "products")
    review1 = Reviews.create(author: "review1", products_id: products.id)
    review22 = Reviews.create(author: "review2", products_id: products.id)
    expect(products.reviews()).to(eq([review1, review2]))
  end
end

describe Products do 
  it("titleizes the name of a product") do
    products = Products.create({name: "tomatoes", cost: 3, country_of_origin: "mexico"})      
    expect(products.name()).to(eq("Tomatoes"))
  end
end
