class Reviews < ApplicationRecord
  belongs_to :products
  validates :author, presence: true
  validates :content_body, presence: true
  validates :content_body, length: { in: 50..250 }
  validates :rating, presence: true
  validates :rating, :numericality => { greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
end
