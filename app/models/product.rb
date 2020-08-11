class Product < ApplicationRecord
  belongs_to :shop
  validates :name, presence: true
  validates :unit_price, presence: true
  validates :description, presence: true
  validates :category, presence: true
  has_many :cart_items, dependent: :destroy
  has_one_attached :photo
  enum category: [:asado, :empanadas, :ensaladas, :panaderia, :pastas, :pizza, :sanguches, :sushi, :otros]

  def self.category_options_for_select
    categories.keys[0...-1].sort + [:otros]
  end
end
