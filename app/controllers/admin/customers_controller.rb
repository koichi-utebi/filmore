class Admin::CustomersController < Admin::ApplicationController
  def index
    @customers = Customer.latest.page(params[:page]).per(20)
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
    case params[:sort_obj]
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
