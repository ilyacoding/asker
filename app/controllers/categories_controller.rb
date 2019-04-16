class CategoriesController < ApplicationController
  before_action :set_category, only: %i(show destroy)

  def index
    @categories = Category.all
  end

  def show; end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to @category, notice: "Категория была успешно создана."
    else
      render :new
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_url, notice: "Категория была успешно удалена."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
