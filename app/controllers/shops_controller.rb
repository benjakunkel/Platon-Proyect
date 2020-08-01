class ShopsController < ApplicationController
 
  def index
      @shops = policy_scope(Shop)
  end

  def show
     authorize @shop
  end

  def new
     authorize @shop
  end

  def create
    authorize @shop
  end

  def edit
     authorize @shop
  end

  def update
     authorize @shop
  end

  def destroy
    autorize @shop
  end

end
