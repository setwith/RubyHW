class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]
  # before_action :set_articles, only: %i[index]

  def index_all
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    @tags = Tag.all
    render json: { author: @authors, articles: @articles, comments: @comments, tags: @tags }
  end

  def index
    @articles = Article.where(nil)

    # http://[::1]:3000/api/v1/articles
    @pagy, @articles = pagy(Article.order(created_at: :desc), items: 15)

    # http://[::1]:3000/api/v1/articles?search=text
    @articles = Article.where('title || body ILIKE ?', "%#{params[:search]}%") if params[:search]

    # http://[::1]:3000/api/v1/articles?status=unpublished
    @articles = Article.filter_by_status(params[:status]) if params[:status]

    render json: @articles, status: :ok
  end

  def show
    @comments = @article.comments.latest_comments
    @tags = @article.tags
    render json: { article: @article, comments: @comments, tags: @tags, likes: @article.likes }
  end

  def create
    @article = Article.new(article_params)
    @tags = @article.tags
    if @article.save
      render json: { article: @article, tags: @tags }, status: :created
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
    params.require(:article).permit(:title, :body, :author_id, :status)
    # params.require(:article).permit(:title, :body, :author_id, tags_attributes: [:name])
  end

  def set_articles
    @articles = Article.all
  end

  # def filter_params
  #   params.permit(:author_id, :tag)
  # end
end
