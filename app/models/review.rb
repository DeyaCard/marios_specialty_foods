class Review < ApplicationRecord
  belongs_to :product
  validates :author, :presence => true
  validates :rating, :presence => true
  validates :rating, :inclusion => { :in => [1,2,3,4,5]}
  validates :content_of_body, :presence => true 
  validates_length_of :content_of_body, minimum: 50, maximum: 250
end
