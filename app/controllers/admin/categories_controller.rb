class Admin::categories_controller < ApplicationController

  def index
    @categories = category.order(id: :desc).all
  end

  def new
    @category = category.new
  end

  def create
    @category = category.new(category_params)

    if @category.save
      redirect_to [:admin, :products], notice: 'Category created!'
    else
      render :new
    end
  end


  private

  def category_params
    params.require(:category).permit(
      :name
    )
  end

end
