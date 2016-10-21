module UsersHelper
  # 返回用户的 Gravatar
  def gravatar_for_user(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?d=identicon"
    image_tag(gravatar_url, alt: user.name, class: "ui circular image")
  end
end
