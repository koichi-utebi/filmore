class Public::PostCommentsController < ApplicationController
  def new
    if customer_signed_in?
      @post = Post.find(params[:post_id])
      @comment = current_customer.post_comments.new
    else
      redirect_to new_customer_session_path
    end
  end
  def create
    post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.new(post_comment_params)
    @comment.post_id = post.id
    @comment.customer_id = current_customer.id
    @comment.save!
    redirect_to post_path(post)
  end

  def destroy
    post = Post.find(params[:post_id])
    @comment = current_customer.post_comments.find_by(post_id: post.id)
    @comment.destroy
    redirect_to request.referer
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
