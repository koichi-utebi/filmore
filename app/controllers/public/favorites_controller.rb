class Public::FavoritesController < ApplicationController
  def create
    if customer_signed_in?
      @post = Post.find(params[:post_id])
      favorite = current_customer.favorite.new(post_id: @post.id)
      favorite.save
      redirect_to request.referer
    else
      redirect_to new_customer_session_path, alert: "ログインが必要です"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorite.find_by(post_id: @post.id)
    favorite.destroy
    redirect_to request.referer
  end
end
