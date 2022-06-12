class Public::WishListsController < ApplicationController
  def create
    if customer_signed_in?
      @wish_list = WishList.new(wish_list_params)
      @wish_list.customer_id = current_customer.id
      if @wish_list.save
        redirect_to request.referer
      else
        redirect_to request.referer
      end
    else
      redirect_to new_customer_session_path
    end
  end

  def destroy
    @wish_list = WishList.find_by(movie_id: params[:id])
    @wish_list.destroy
    redirect_to request.referer
  end

  private
  def wish_list_params
    params.require(:wish_list).permit(:movie_id, :poster_path, :title)
  end
end
