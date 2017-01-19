class ArticlesController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]
  before_action :authorize_action, only: [:edit, :update, :destroy]

  def index
    @articles = Article.order 'created_at DESC'
    @comments = Comment.order 'created_at DESC'
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.order 'created_at DESC'
  end

  def new
    @comments = Comment.order 'created_at DESC'
  end

  def create
    @article = Article.new(article_params)
  
    if @article.save
      redirect_to @article
    else
      @error = @article.errors.full_messages
      render action: 'new'
    end
  end

  def edit
    #can_edit?(@article)
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render action: 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  private 

  def article_params
    params.require(:article).permit(:title, :text)
  end

  def authorize_action
    article_permission.can_update?(user)
    article_permission.can?(action, user)
    user_permissions = Permissions::UsersPerm.new(current_user)
    user_permissions.can?(action, article)
  end
end
