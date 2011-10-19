class Admin::CommentsController < ApplicationController
  def index
    @articles = Article.all
  end
end
