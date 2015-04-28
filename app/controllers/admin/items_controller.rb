class Admin::ItemsController < Admin::BaseController
  def new
    @item = Item.new
  end

  def index
    @items = Item.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:notice] = "#{@item.title} created!"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price)
  end
end
