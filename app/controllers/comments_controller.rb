class CommentsController < ApplicationController
  respond_to :html, :json

  def index
    @comments = Comment.where(:article_id => params[:article_id]).all

    respond_with @comments
  end

  def create
    @comment = Comment.create(params[:comment])

    if @comment.save
      flash[:success] = "Your comment has been saved!"
    end

    redirect_to :controller => 'articles', :action => 'show'
  end

  def destroy
    if current_user.admin
      @comment = Comment.where(:id => params[:id]).first
      comment_id = @comment.id
      comment_article_title = @comment.article.title
      @comment.delete

      flash[:warning] = "Comment ##{comment_id} has been deleted from \"#{comment_article_title}\""
    end

    redirect_to session[:return_to]
  end
end
