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
    if @cart.shop.user_id == current_user.id
      @cart.update(delivery_status: 1) 
      redirect_to dashboard_path
      return
    else
      @cart.update(submited_at: Time.current)
      redirect_to confirmation_path
    end  
  end

end
