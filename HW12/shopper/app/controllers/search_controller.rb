class SearchController < ApplicationController
  def index
    @querry = Product.ransack(params[:q])
    @products = @querry.result(distinct: true)
  end
end
