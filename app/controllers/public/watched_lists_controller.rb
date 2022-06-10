class Public::WatchedListsController < ApplicationController
  def index
    @watched_lists = WatchedList.latest
  end

  def create
    @watched_list = WatchedList.new
    if @watched_list.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
  end

  private
  def watched_list_params
    params.require(:watched_list).permit(:movie_id, :poster_path, :title)
  end
end
