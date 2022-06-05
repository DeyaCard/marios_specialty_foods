class Products < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_products)

  private
    def titleize_products
     self.name = self.name.titleize
    end
end
