class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.first(2)
    @carts = Cart.all
    @cart_items = CartItem.all
    @total = 0 
    @destacados = Shop.joins(:products).distinct.select('shops.*, COUNT(products.*) AS products_count').group('shops.id').order("products_count DESC").first(2)
  end
  
  def confirmation
  end
end
