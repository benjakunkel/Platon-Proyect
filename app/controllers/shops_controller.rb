class ShopsController < ApplicationController
skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @category = params[:category]
    if @category.present?
      @products = Product.where(category: @category)
      @shops = policy_scope(Shop).with_category(@category)
    else
      @shops = policy_scope(Shop)
      @products = Product.order("RANDOM()").first(10)
    end
      @destacados = Shop.joins(:products).distinct.select('shops.*, COUNT(products.*) AS products_count').group('shops.id').order("products_count DESC")
    
  end

  def show
    @shop = Shop.find(params[:id])
    authorize @shop
    @products = Product.where(shop_id: @shop.id)
    @markers = [{lat: @shop.latitude,
      lng: @shop.longitude,
      infoWindow: render_to_string(partial: "info_window", locals: { shop: @shop })
    }]
  end

  def new
    @shop = Shop.new
    authorize @shop
  end

  def create
    @shop = Shop.new(shop_params)
    if @shop.save
      flash[:notice] = "Creado con exito"
      redirect_to @shop
    else
      flash[:error] = "Error al crear el comercio"
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
      flash[:notice] = "Actualizado con exito"
      redirect_to @shop
    else
      flash[:notice] = "Intenta nuevamente"
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
    params.require(:shop).permit(:name, :address, :email, :phone_number, :user_id, :photo)
  end
end
