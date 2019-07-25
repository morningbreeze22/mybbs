class RepliesController < ApplicationController
  def new

  end

  def create
    @article = Article.find(params[:article_id])
    @reply = @article.replies.create(reply_params)
    current_user.replies << @reply
    redirect_to forum_article_path(@article.forum_id,@article)
  end

  def show
    #@article = Article.find(params[:article_id])
    #@replies = @article.replies
    #@result = [:article => @article, :replies => @replies]
  end

  def destroy
    @article = Article.find(params[:article_id])
    @reply= Reply.find(params[:id])
    @reply.destroy
    redirect_to forum_article_path(@article.forum_id,@article)
  end

  private
  def reply_params
    params.require(:reply).permit(:poster,:body)
  end

end
