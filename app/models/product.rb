class Product < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  validates :unit_price, presence: true
  validates :description, presence: true
  validates :category, presence: true
  has_many :cart_items, dependent: :destroy
  has_one_attached :photo
  enum category: [:pastas, :panaderia, :ensaladas, :asado, :sushi, :pizza, :empanadas, :sanguches, :otros]
end
