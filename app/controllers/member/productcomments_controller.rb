class Member::ProductcommentsController < ApplicationController
  # メンバー会員（店員）がコメントするためのコントローラ
  
  def create
    @product = Product.find(params[:product_id])
    comment = current_user.productcomments.new(productcomment_params)
    comment.product_id = @product.id
    comment.save
    # app/views/book_comments/create.js.erbを参照
    
    # @comment.save
    # redirect_to product_path(@product)
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    productcomment = Productcomment.find(params[:id])
    productcomment.destroy
    # redirect_to request.referer
    # app/views/book_comments/destroy.js.erbを参照する
  end
  
  private

  def productcomment_params
    params.require(:productcomment).permit(:comment)
  end
end
