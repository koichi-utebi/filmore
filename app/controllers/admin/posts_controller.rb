class Admin::PostsController < Admin::ApplicationController
  def index
    @posts = Post.latest.page(params[:page]).per(20)
  end

  def show
    @post = Post.find(params[:id])
    @customer = @post.customer
    @post_comments = @post.post_comments
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post), notice: "レビューを更新しました"
    else
      render :edit
    end
  end

  def post_search
    @word = params[:word]
    @total_posts = Post.where("title LIKE?","%#{@word}%")
    @posts = @total_posts.latest.page(params[:page])
    render "index"
  end

  def post_sort
    case params[:sort_obj]
    when "old"
      @posts = Post.page(params[:page])
      render "index"
    else # default(new)
      @posts = Post.latest.page(params[:page])
      render "index"
    end
  end

  private
  def post_params
    params.require(:post).permit(:movie_id, :review_title, :review_body, :watched_data, :way_to_watch, :rate, :spoiler, :is_active, :title, :poster_path)
  end
end
