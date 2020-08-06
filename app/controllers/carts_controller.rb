class CartsController < ApplicationController
  
  def show
    @cart = Cart.find(params[:id])
    authorize @cart
  end

  def update
    
  end
end
