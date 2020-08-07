class CartsController < ApplicationController
  
  def show
    @cart = Cart.find(params[:id])
    authorize @cart
  end

  def update
    @cart = Cart.find(params[:id])
    authorize @cart
    @cart.update(submited_at: Time.current)
    redirect_to confirmation_path
  end
end
