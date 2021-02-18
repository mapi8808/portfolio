class Member::ProductCommentsController < ApplicationController
  # メンバー会員（店員）がコメントするためのコントローラ
  
  def create
    @product = Product.find(params[:product_id])
    @comment = current_user.product_comments.new(product_comment_params)
    @comment.product_id = @product.id
    # unless @book_comment.save
    # render 'error'
    # end
    comment.save
    redirect_to product_path(@product)
  end
  
  def destroy
    @product = Product.find(params[:product_id])
    product_comment = ProductComment.find(params[:id])
    product_comment.destroy
  end
  
  private

  def product_comment_params
    params.require(:product_comment).permit(:comment)
  end
end
