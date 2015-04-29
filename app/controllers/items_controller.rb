class MenuItemsController < ApplicationController
  def index
    @items = Item.all
  end
end
