class Cart < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  def total
    cart_items.sum do |item|
      item.subtotal_price * item.quantity
    end
  end

  def number_of_items
    cart_items.count
  end

  def has_items?
    number_of_items > 0
  end
end
