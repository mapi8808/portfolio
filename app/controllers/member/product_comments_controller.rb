class Member::ProductCommentsController < ApplicationController
  
  def create
    product = Product.find(params[:product_id])
    comment = current_user.product_comments.new(product_comment_params)
    comment.product_id = product.id
    comment.save
    redirect_to product_path(product)
  end
  
  def destroy
    ProductComment.find_by(id: params[:id], product_id: params[:product_id]).destroy
    redirect_to product_path(params[:product_id])
  end
  
  private

  def product_comment_params
    params.require(:product_comment).permit(:comment)
  end
end
