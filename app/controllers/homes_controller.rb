class HomesController < ApplicationController
  # トップ画面
  def top
    @products = Product.all
  end
  # サイト概要・作成経緯
  def about
  end

end
