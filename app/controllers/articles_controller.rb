class ArticlesController < ApplicationController
  respond_to :html, :json

  # Create a new article and send it to a form for the user to
  # fill in.
  def new
    @article = Article.new

    respond_with @article
  end

  def create
    @article = Article.new(params[:article])
    if @article.save

    end

    respond_with @article
  end

  def show
    @article = Article.find(params[:id])

    respond_with @article
  end
end
