class Api::V1::AuthorsController < ApplicationController
  before_action :set_author, only: %i[show destroy]

  def index
    @authors = Author.all
    render json: @authors
  end

  def show
    render json: @author
  end

  def published_comments
    @author = Author.find(params[:author_id])
    @comments = @author.comments.published.order(created_at: :desc)
    render json: @comments
  end

  def unpublished_comments
    @author = Author.find(params[:author_id])
    @comments = @author.comments.unpublished.order(created_at: :desc)
    render json: @comments
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      render json: @author
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      head :no_content
    else
      render json: @author.errors, status: :unprocessable_entity
    end
  end

  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name)
  end
end
