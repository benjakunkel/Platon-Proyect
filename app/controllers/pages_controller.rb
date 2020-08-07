class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.first(2)
  end

  def confirmation
    @cart = Cart.find(current_user.id)
  end
end
