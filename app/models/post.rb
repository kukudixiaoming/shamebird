class Post < ActiveRecord::Base
  belongs_to :category
  validates :post_title, presence: true, length: {maximum: 70}

  validates :post_text, presence: true

  validates :post_image, presence: true, length: { maximum: 255}
end
