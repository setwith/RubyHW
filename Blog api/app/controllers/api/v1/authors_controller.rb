class Api::V1::AuthorsController < ApplicationController
  
  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author, status: :ok
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  private

    def author_params
      params.require(:author).permit(:name)
    end
end
