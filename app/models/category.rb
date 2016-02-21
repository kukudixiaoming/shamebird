class Category < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  validates :category_name, presence: true, length: { maximum: 17 },
  uniqueness: { case_sensitive: false }

  validates :category_brief, presence: true, length: { maximum: 255 }

  validates :category_image, presence: true, length: { maximum: 255 },
  uniqueness: { case_sensitive: false }
end
