class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index_all
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    @tags = Tag.all
    render json: { author: @authors, articles: @articles, comments: @comments, tags: @tags }
  end

  def index
    @articles = Article.all
    render json: @articles, status: :ok
  end

  def show
    @comments = @article.comments.latest_comments
    @tags = @article.all_tags
    render json: { article: @article, comments: @comments, tags: @tags, likes: @article.likes }
  end

  def create
    @article = Article.new(article_params)
    # @tags = @article.all_tags(params[:name])
    if @article.save
      render json: @article, status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      render json: @article, status: :ok
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @article.destroy
      head :no_content
    else
      render json: article.errors, status: :unprocessable_entity
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id, :tags)
  end
end
