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
  end
  
  def update
  end
  
  def destroy
  end
  
end
