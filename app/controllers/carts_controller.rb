class CartsController < ApplicationController
  
  def show
    @cart = Cart.find(params[:id])
    @cart_items = CartItem.all
    # @products = Product.all
    # @products.each do |product|
    #   if  product.name == @cart_items.product.name
    #     @cart_item.quantity += 1
    #   end
    # end
    
    authorize @cart
  end

  def update
    @cart = Cart.find(params[:id])
    authorize @cart
    @cart.update(submited_at: Time.current)
    redirect_to confirmation_path
  end

end
