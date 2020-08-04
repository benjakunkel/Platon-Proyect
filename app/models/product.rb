class Product < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  validates :unit_price, presence: true
  validates :description, presence: true
end
