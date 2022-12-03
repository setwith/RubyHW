class Api::V1::AuthorsController < ApplicationController
  def index
    @authors = Author.all
    render json: @authors
  end

  def show
    @author = Author.find(params[:id])
    render json: @author
  end

  def published_comments
    @author = Author.find(params[:id])
    @comments = @author.comments.published.order(created_at: :desc)
    render json: @comments
  end

  def unpublished_comments
    @author = Author.find(params[:id])
    @comments = @author.comments.unpublished.order(created_at: :desc)
    render json: @comments
  end

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
