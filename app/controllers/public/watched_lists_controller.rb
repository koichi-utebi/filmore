class Public::WatchedListsController < ApplicationController
  def index
    @watched_lists = WatchedList.latest
  end

  def create
    @watched_list = WatchedList.new(watched_list_params)
    @watched_list.customer_id = current_customer.id
    if @watched_list.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @watched_list = WatchedList.find_by(movie_id: params[:id])
    @watched_list.destroy
    redirect_to request.referer
  end

  private
  def watched_list_params
    params.require(:watched_list).permit(:movie_id, :poster_path, :title)
  end
end
