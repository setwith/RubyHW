class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      render json: @like.likeable
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      head :no_content
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:author_id, :likeable_id, :likeable_type)
  end
end
