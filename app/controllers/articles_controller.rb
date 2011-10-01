class ArticlesController < ApplicationController
  respond_to :html, :json

  before_filter :authenticate_user!, :only => [:new, :create]

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

  def edit
    @article = Article.find(params[:id])

    respond_with @article
  end

  def update
    @article = Article.find(params[:id])

    @article.title = params[:article][:title]
    @article.body = params[:article][:body]

    @article.save

    redirect_to :action => :show, :id => @article.id
  end
end
