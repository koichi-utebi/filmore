class Public::PostsController < ApplicationController
  def index
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
  end

  def new
    @post = Post.new(post_params)
    @current_customer_post = Post.find_by(customer_id: current_customer.id, movie_id: @post.movie_id)
    if @current_customer_post.present?
      redirect_to movies_path
    else
      render 'new'
    end
  end

  def check
    @post = Post.new(post_params)
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save!
      redirect_to post_path(@post)
    else
      redirect_to movies_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    if @post.customer_id == current_customer.id
      render :edit
    else
      redirect_to root_path
    end
  end


  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to movies_path
  end

  private
  def post_params
    params.require(:post).permit(:movie_id, :review_title, :review_body, :watched_data, :way_to_watch, :rate, :spoiler, :is_active, :title, :poster_path)
  end

end
