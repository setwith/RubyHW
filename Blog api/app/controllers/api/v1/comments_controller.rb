class Api::V1::CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: %i[show update update_status destroy]

  def index
    @comments = Comment.all
    render json: @comments
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def published
    @comments = Comment.published
    render json: @comments
  end

  def unpublished
    @comments = Comment.unpublished
    render json: @comments
  end

  def update_status
    @comment.update(status: params[:status])
    render json: @comment, notice: "Comment updated to #{@comment.status} "
  end

  def update
    if @comment.update(comment_params)
      render json: @comment, status: :ok
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @comment.destroy
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_article
    @article = Article.find(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :article_id, :author_id)
  end
end
