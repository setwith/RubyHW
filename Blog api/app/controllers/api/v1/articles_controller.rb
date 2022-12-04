class Api::V1::ArticlesController < ApplicationController
  before_action :set_article, only: %i[show update destroy]

  def index_all
    @authors = Author.all
    @articles = Article.all
    @comments = Comment.all
    render json: { author: @authors, articles: @articles, comments: @comments }
  end

  def index
    @author = Author.find(params[:author_id])
    @articles = @author.articles.all
    render json: @articles, status: :ok
  end

  def show
    @author = Author.find(params[:author_id])
    @articles = @author.articles.all
    @comments = @article.comments.order(created_at: :desc)
    render json: { author: @authors, articles: @articles, comments: @comments }
  end

  def create
    @article = Article.new(article_params)
    # @article.author_id = params[:author_id]
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
    @author = Author.find(params[:author_id])
    @article = @author.articles.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :author_id)
  end
end
