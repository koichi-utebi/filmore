class Public::RelationshipsController < ApplicationController
  def create
    @customer = Customer.find(params[:customer_id])
    current_customer.follow(params[:customer_id])
    redirect_to request.referer
  end

  def destroy
    @customer = Customer.find(params[:customer_id])
    current_customer.unfollow(params[:customer_id])
    redirect_to request.referer
  end
end
