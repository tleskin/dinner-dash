class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Order Successfully Placed"
      redirect_to current_user
    else
      flash[:notice] = "Grow your beard, try again"
      redirect_to checkout_path
    end
  end


  private

  def order_params
    params.require(:order).permit(:user_id, :subtotal)
  end

end
