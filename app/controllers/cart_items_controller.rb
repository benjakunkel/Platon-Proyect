class CartItemsController < ApplicationController
  
  def create
    @product = Product.find(params[:product_id])
    @shop = @product.shop
    @cart_item = CartItem.new(product: @product, quantity: 1, subtotal_price: @product.unit_price)
    if current_user.carts.empty? || current_user.carts.last.submited_at.present?
      @cart = Cart.new
    else
      @cart = current_user.carts.last
    end
    authorize @cart_item
    @cart.user = current_user
    @cart.shop = @product.shop
    @cart.save!
    @cart.cart_items.joins(:product).merge(Product.where.not(shop: @shop)).destroy_all
    @cart_item.cart = @cart
    @cart_item.save!
    flash[:notice] = "#{@product.name} ha sido agregado"
    redirect_to @shop
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart = @cart_item.cart
    authorize @cart_item
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  def increase
    @cart_item = CartItem.find(params[:id])
    authorize @cart_item
    @cart_item.quantity += 1
    @cart_item.save
    redirect_to @cart_item.product.shop
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
