class ArticlesController < ApplicationController
  def new

  end

  def create
    @forum = Forum.find(params[:forum_id])
    @article = @forum.articles.create(article_params)
    redirect_to forum_path(@forum)
  end

  def index

  end

  def show

  end

  def update

  end

  def destroy

  end

  private
  def article_params
    params.require(:article).permit(:title, :author, :body)
  end

end