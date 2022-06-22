class Public::CustomersController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:show]
  def show
    @customer = Customer.find(params[:id])
    #会員ごとの投稿一覧
    @posts = @customer.posts.where(is_active: true).latest.page(params[:page]).per(10)

    #会員ごとのリストの映画一覧
    @watched_lists = @customer.watched_lists.latest
    @wish_lists = @customer.wish_lists.latest

    #会員ごとのフォロー・フォロワーリスト
    @customer_followings = @customer.followings
    @customer_followers = @customer.followers

    #会員ごとのいいねした投稿
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def edit
    @customer = Customer.find(params[:id])
    if @customer.id == current_customer.id
      render :edit
    else
      redirect_to request.referer
    end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def quit_check
    @customer = current_customer.id
  end

  def withdraw
    @customer = current_customer
    if @customer.update(is_active: false)
      reset_session
      redirect_to root_path, notice: "退会しました"
    else
      render "quit_check"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image)
  end
end
