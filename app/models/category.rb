class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :microblogs, dependent: :destroy
  has_many :albums, dependent: :destroy
  mount_uploader :category_image, CatPicUploader
  validate :picture_size
  validates :category_name, presence: true, length: {maximum: 17},
            uniqueness: {case_sensitive: false}

  validates :category_brief, presence: true, length: {maximum: 255}
  validates :category_type, presence: true
  validates :category_image, presence: true
  # uniqueness: { case_sensitive: false }

  private
  # 验证上传的图片大小
  def picture_size
    if category_image.size > 5.megabytes
      errors.add(:category_image, "should be less than 5MB")
    end
  end
end
