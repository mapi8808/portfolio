class Member::ProductsController < ApplicationController
  # メンバー会員の内容
  # before関連入力　バリデーション カリキュラム参照
  # before_action :authenticate_user!,except: [:top]
  
  def index
    @products = Product.all
    # @shops = @users.shop
  end
  
  def show
    @product = Product.find(params[:id])
    @shop = Shop.find(params[:id])
    @product_comment = ProductComment.new
  end
  
  def edit
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
  
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    @product.save
    redirect_to product_path(@product.id)
  end
  
  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to product_path(@product.id)
  end
  
  def destroy
    product = Product(params[:id])
    product.destroy
    redirect_to product_path
  end
  
  private
  
  def product_params
    params.require(:product).permit(:product_name, :image, :body, :amounts, :shop_id, :genre_id)
  end
    
end
