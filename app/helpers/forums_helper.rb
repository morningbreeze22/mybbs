module ForumsHelper
  def isfavored?(forum)
    current_user.forums.exists? forum.id
  end

end
