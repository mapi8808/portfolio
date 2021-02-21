class Member::ProductsController < ApplicationController
   # メンバー会員の内容
  # before関連入力　バリデーション カリキュラム参照
  # before_action :authenticate_user!,except: [:top]

  def index
    @products = Product.all
    @shops = Shop.all
  end

  def show
    @product = Product.find(params[:id])
    @shop = @product.shop
    @comment = Productcomment.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @shop = current_user.shop
    @product = @shop.products.build(product_params)
    @product.user_id = current_user.id
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :new
    end
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
      redirect_to @product
    else
      render :edit
    end
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