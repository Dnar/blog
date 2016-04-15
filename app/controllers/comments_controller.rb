class CommentsController < ApplicationController

  before_filter :authenticate_user!, :only => [:create]

  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new do |c|
      c.author = current_user.username.capitalize!
      c.body = comment_params[:body]
    end
    @comment.save
    redirect_to article_path(@article)
  end

  def comment_params
    params.require(:comment).permit(:author, :body) # require - требуем наличия парамметров --> вызывается permit, с определенными полями.
  end

end
