class ShopsController < ApplicationController

  def show
    @shop = Shop.find(params[:id])
  end
  
  def edit
    @shop = Shop.find(params[:id])
  end
  
  def new
    @shop = Shop.new
  end
  
  def create
    @shop = Shop.new(shop_params)
    shop.save
    redirect_to shop_path
  end
  
  def update
    @shop = Shop.find(params[:id])
    shop.update(shop_params)
    redirect_to shop_path
  end
  
  def destroy
    shop = Shop(params[:id])
    shop.destroy
    redirect_to root_path
  end
  
  private
  
  def shop_params
    params.require(:shop).permit(:shop_name, :url, :address, :tel, :hours, :holoday)
  end
  
end
