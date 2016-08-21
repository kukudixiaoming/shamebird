class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments
  mount_uploader :post_image, PostUploader
  validates :post_title, presence: true, length: {maximum: 70}

  validates :post_text, presence: true, length: {minimum: 15}

  # validates :post_image, presence: true, length: { maximum: 255}

  validate :picture_size

  private

  # 验证上传的图片大小
  def picture_size
    if post_image.size > 5.megabytes
      errors.add(:post_image, "should be less than 5MB")
    end
  end
end
