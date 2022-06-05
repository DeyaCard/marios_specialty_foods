class Products < ApplicationRecord
  scope :most_reviews, -> {(
    select("products.id, products.name, count(reviews.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
    )}
  scope :three_most_recent, -> { order(create_at: :desc).limit(3)}
  scope :from_usa, -> { where(country_of_origin: "United States of America")}

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :cost, numericality: true
  validates :country_of_origin: true
  
  before_save(:titleize_products)

  private
    def titleize_products
     self.name = self.name.titleize
    end
end
