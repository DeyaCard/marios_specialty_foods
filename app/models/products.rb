class Products < ApplicationRecord
  has_many :reviews, dependent: :destroy
end
