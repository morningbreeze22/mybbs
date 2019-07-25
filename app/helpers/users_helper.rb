module UsersHelper

  def findarticle(id)
    @reply = Reply.find(id)
    @article= Article.find(@reply.article_id)
  end

  def findforum(id)
    @reply = Reply.find(id)
    @article= Article.find(@reply.article_id)
    @forum= Forum.find(@article.forum_id)
  end
end
