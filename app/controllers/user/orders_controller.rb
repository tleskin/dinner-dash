class User::OrdersController < User::BaseController
  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
  end
end