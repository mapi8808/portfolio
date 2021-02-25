class Member::ProductsController < ApplicationController
  # メンバー会員の内容
  # 未ログインで、一覧と詳細以外の画面にアクセスするとログイン画面へ
  before_action :authenticate_user!,except: [:index, :show]

  def index
    @products = Product.page(params[:page]).reverse_order
    @shop = Shop.name
    @genres = Genre.all
  end

  def show
    @product = Product.find(params[:id])
    @shop = @product.shop
    @comment = Productcomment.new
    @genre = @product.genre
  end

  def edit 
    @product = Product.find(params[:id])
    if @product.user == current_user # ログインユーザーと登録したユーザーが同じ人以外、直接URLにとんでも、home画面にいくように。 
      render :edit
    else
      redirect_to root_path
    end
  end

  def new
    @product = Product.new
    if current_user # ログインユーザー以外、直接URLにとんでも、home画面にいくように。 
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    @shop = current_user.shop
    @product = @shop.products.build(product_params)
    @product.user_id = current_user.id
    if @product.save
    flash[:create] = "商品情報を追加しました"
      redirect_to product_path(@product.id)
    else
      @products = Product.all
      render :new
    end
  end

  def update
    @product = current_user.products.find(params[:id])
    if @product.update(product_params)
    flash[:update] = "商品情報を更新しました"
      redirect_to @product
    else
      @products = Product.find(params[:id])
      render :edit
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
    flash[:destroy] = "商品情報を削除しました"
    redirect_to products_path
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_name, :image, :body, :amounts, :shop_id, :genre_id)
  end

end