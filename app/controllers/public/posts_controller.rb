class Public::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new(post_params)
  end

  def check
    @post = Post.new(post_params)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      redirect_to post_path(@post)
    else
      redirect_to movies_path
    end
  end

  def edit
  end


  def update
  end

  def delete
  end

  private
  def post_params
    params.require(:post).permit(:movie_id, :review_title, :review_body, :watched_data, :way_to_watch, :rate, :spoiler, :is_active)
  end

end
