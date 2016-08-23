class Microblog < ActiveRecord::Base
  mount_uploader :photo, PictureUploader
  validate :photo_size
  # validates :text, presence: true
  # validates :music, presence: true
  # validates :photo, presence: true
  belongs_to :category

  private

  #验证上传的图片大小
  def photo_size
    if photo.size > 5.megabytes
      errors.add(:photo, "图片的尺寸应该小于5MB")
    end
  end
end
