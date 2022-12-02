class Api::V1::CommentsController < ApplicationController
  before_action :set_article, only: %i[show update update_status destroy]
  before_action :set_comment, only: %i[show update update_status destroy]

  def index
    @article = Article.find(params[:article_id])
    @comments = @article.comments.all
    render json: @comments, status: :ok
  end

  def show
    render json: @comment
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = params[:author_id]
    @comment.article_id = params[:article_id]
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def published_comments
    @author = Author.find(params[:author_id])
    @comments = @author.comments.published.order(created_at: :desc)
    render json: @comments
  end

  def unpublished_comments
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
    params.require(:comment).permit(:body, :status)
  end
end
