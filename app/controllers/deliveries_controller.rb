class DeliveriesController < ApplicationController
 
  def create
    @cart = Cart.find(params[:cart_id])
    authorize @cart
    @cart.update(delivery_status: "entregado")
    flash[:notice] = "Su pedido ha sido entregado"
    redirect_to dashboard_path
  end

  
end
