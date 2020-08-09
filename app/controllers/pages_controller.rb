class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.first(2)
    @carts = Cart.all
    @cart_items = CartItem.all
    @total = 0 
  end
  
  def confirmation
  end
end
