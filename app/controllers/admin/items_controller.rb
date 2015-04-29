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
      category_collection = params[:item][:categories].reject(&:empty?)
      @item.categories << category_collection.map {|id| Category.find(id.to_i)}
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    category_collection = params[:item][:categories].reject {|x| x.empty?}
    @item = Item.find(params[:id])
    @item.categories << category_collection.map { |id| Category.find(id.to_i) }

    if @item.update(item_params)
      flash[:notice] = "#{@item.title} Updated"
      redirect_to admin_item_path(@item)
    else
      flash[:error] = @item.errors.full_messages.join(", ")
      redirect_to admin_item_path(@item)
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :description, :price, :status, :categories)
  end
end
