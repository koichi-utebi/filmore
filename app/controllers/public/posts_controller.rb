class Public::PostsController < ApplicationController
  def index
    @posts = Post.latest.page(params[:page]).per(10)
    @customer = current_customer
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comments = @post.post_comments
  end

  def new
    if customer_signed_in?
      @post = Post.new(post_params)
      @current_customer_post = Post.find_by(customer_id: current_customer.id, movie_id: @post.movie_id)
      if @current_customer_post.present?
        redirect_to movies_path
      else
        render 'new'
      end
    else
      redirect_to new_customer_session_path
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
