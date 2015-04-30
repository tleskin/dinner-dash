class CheckoutsController < ApplicationController

  def create

    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "you know have #{pluralize(@cart.count_of(item), item.title)}"
    redirect_to items_path
  end

  def edit
    @items = @cart.find_items
    @item_quantities = @cart.contents
  end

  def update
    if params[:change] == "increase"
      @cart.increase_quantity(params[:item_id])
      redirect_to checkout_path
    elsif params[:change] == "decrease"
      @cart.decrease_quantity(params[:item_id])
      redirect_to checkout_path
    end
  end
end
