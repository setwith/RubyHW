class SearchController < ApplicationController
  def index
    @products = @query.result(distinct: true)
  end
end
