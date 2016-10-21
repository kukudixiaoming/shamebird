module CommentsHelper
  # 返回评论者的 Gravatar
  def gravatar_for_commenter(commenter)
    gravatar_id = Digest::MD5::hexdigest(commenter.comment_email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_url, alt: commenter.comment_author)
  end
end
