class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:message] = "Category was successfully created!"
      redirect_to admin_categories_path
    else
      flash[:error] = "Category creation failed!"
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :description)
  end

end 