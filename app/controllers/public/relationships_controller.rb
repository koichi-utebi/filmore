class Public::RelationshipsController < Public::ApplicationController
  def create
    if customer_signed_in?
      @customer = Customer.find(params[:customer_id])
      current_customer.follow(params[:customer_id])
      redirect_to request.referer
    else
      redirect_to new_customer_session_path
    end
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
end
