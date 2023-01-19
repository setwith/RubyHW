class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def show
    @products = @category.products
  end

  private

  def set_category
    @category = Category.find_by(id: params[:id])
  end
end
