class Album < ActiveRecord::Base
  belongs_to :category
  mount_uploader :picture, AlbumUploader
  validate :picture_size

  private
  # 验证上传的图片大小
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "should be less than 5MB")
    end
  end
end
