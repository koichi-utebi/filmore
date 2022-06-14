class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.latest.page(params[:page]).per(20)
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.latest.page(params[:page]).per(10)
    @watched_lists = @customer.watched_lists.latest
    @wish_lists = @customer.wish_lists.latest
    @customer_followings = @customer.followings
    @customer_followers = @customer.followers
    favorites = Favorite.where(customer_id: @customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customers_path
    else
      render :edit
    end
  end

  def customer_search
    @word = params[:word]
    @total_customers = Customer.where("name LIKE?", "%#{@word}%")
    @customers = @total_customers.page(params[:page])
    render "index"
  end

  def customer_sort
    case params[:sort_customers]
    when "old"
      @customers = Customer.page(params[:page])
      render "index"
    else # default(new)
      @customers = Customer.latest.page(params[:page])
      render "index"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :profile_image, :is_active)
  end
end
