class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :cart_items
  has_many :products, through: :cart_items

  def total
    cart_items.sum do |item|
      item.subtotal_price * item.quantity
    end
  end
end
