class Products < ApplicationRecord
  has_many :reviews, dependent: :destroy
end

before_save(:titleize_products)

private
  def titleize_products
    self.name = self.name.titleize
  end
end
