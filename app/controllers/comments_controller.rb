class CommentsController < ApplicationController
  respond_to :html, :json, :js

  def index
    @comments = Comment.where(:article_id => params[:article_id]).all

    respond_with @comments
  end

  def create
    @comment = Comment.create(params[:comment])

    if @comment.save
      @msg = "Your comment has been saved!"
    else
      @msg = "Your comment could not be saved!"
    end

    @comments = Article.find(@comment.article_id).comments

    respond_with @comment
  end

  def destroy
    if current_user.admin
      @comment = Comment.where(:id => params[:id]).first
      comment_id = @comment.id
      comment_article_title = @comment.article.title
      @comment.delete

      flash[:warning] = "Comment ##{comment_id} has been deleted from \"#{comment_article_title}\""
      session[:return_to] = article_path(@comment.article)
    end

    redirect_to session[:return_to]
  end
end
