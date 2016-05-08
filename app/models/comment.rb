
class Comment < ActiveRecord::Base
  belongs_to :post

  before_save { self.comment_email = comment_email.downcase }

  validates :comment_author, presence: true, length: { maximum: 15 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :comment_email, presence: true, length: { maximum: 255},
  format: { with: VALID_EMAIL_REGEX }

  # VALID_COMMENT_SITE_REGEX = (http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&amp;:/~\+#]*[\w\-\@?^=%&amp;/~\+#])?
  #
  # validates :comment_site, length: { maximum: 255},
  # format: { with: VALID_COMMENT_SITE_REGEX }

  validates :comment_text, presence: true

end
