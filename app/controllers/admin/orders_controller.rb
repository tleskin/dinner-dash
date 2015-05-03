class Admin::OrdersController < Admin::BaseController
  def dashboard
    @orders = Order.all
    render :dashboard
  end

  def show
  end
end
