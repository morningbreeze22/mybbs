class ArticlesController < ApplicationController
  def new

  end

  def create
    @forum = Forum.find(params[:forum_id])
    @article = @forum.articles.create(article_params)
    current_user.articles << @article
    redirect_to forum_path(@forum)
  end

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def update

  end

  def destroy

  end

  private
  def article_params
    params.require(:article).permit(:title, :author, :body, :user_id)
  end

end