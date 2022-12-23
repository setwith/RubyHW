class ProductsController < ApplicationController
  before_action :set_product, only: [:show]

  def index
    @products = Product.all
  end

  def show; end

  private

  def set_product
    @product = Product.find(params_product)
  end

  def params_product
    params.require(:product).permit(:name, :description, :price, :image)
  end
end
