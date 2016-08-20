module CommentsHelper
  # 返回评论者的 Gravatar
  def gravatar_for(comment)
    gravatar_id = Digest::MD5::hexdigest(comment.comment_email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_url, alt: comment.comment_author)
  end
end
