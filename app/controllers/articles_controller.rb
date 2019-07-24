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
    if @article.clicks.present?
      @article.update :clicks=>@article.clicks+1
    else
      @article.clicks=1
    end
    @article.save
    @article
  end

  def update

  end

  def destroy

  end

  def like
    @article = Article.find(params[:id])
    if @article.liked.present?
      @article.update :liked=>@article.liked+1
    else
      @article.liked=1
    end
    if @article.save
      respond_to do |format|
        #format.html
        format.js { render }
        #format.json {render json: @article, status: ok, location: @article}
      end
    end
  end


  private
  def article_params
    params.require(:article).permit(:title, :author, :body, :user_id)
  end

end