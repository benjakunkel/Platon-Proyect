class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :cart_items
  has_many :products, through: :cart_items
end
