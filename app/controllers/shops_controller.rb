class ShopsController < ApplicationController
 
  def index
      @shops = policy_scope(Shop)
      @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
    @products = Product.where(shop_id: @shop.id)
    authorize @shop
  end

  def new
    @shop = Shop.new
    authorize @shop
  end
  
  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:success] = "Creado con exito"
      redirect_to @shop
    else
      flash[:error] = "Fallo"
      render 'new'
    end
    authorize @shop
  end

  def edit
    @shop = Shop.find(params[:id])
    authorize @shop
  end

 
  def update
  @shop = Shop.find(params[:id])
    if @shop.update_attributes(shop_params)
      flash[:success] = "Actualizado con exito"
      redirect_to @shop
    else
      flash[:error] = "Intenta nuevamente"
      render 'edit'
    end
    authorize @shop
  end

  def destroy
    @shop = Shop.find(params[:id])
    authorize @shop
    @shop.destroy
    redirect_to shops_path
  end

private
  def shop_params
    params.require(:shop).permit(:name, :address, :email, :phone_number, :user_id)
  end
end
