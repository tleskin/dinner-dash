class CheckoutsController < ApplicationController

  def create

    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "you know have #{pluralize(@cart.count_of(item), item.title)}"
    redirect_to items_path
  end

  def show
    @items = session[:cart].keys.map {|item_id| Item.find(item_id)}
  end
end
