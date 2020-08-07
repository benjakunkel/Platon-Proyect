class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @shops = Shop.first(2)
  end

  def confirmation
    @cart = current_user.active_cart 
    
  end
end
