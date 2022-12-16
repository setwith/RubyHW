class Api::V1::CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy update_status]

  def index
    @comments = Comment.all
    render json: @comments, status: :ok
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def update_status
    @comment.update(status: new_status)
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
    @comment = Comment.find(params[:id] || params[:comment_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :status, :author_id, :article_id)
  end

  def new_status
    @comment.status == 'unpublished' ? 'published' : 'unpublished'
  end
end
