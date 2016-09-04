class Image < ActiveRecord::Base
  belongs_to :post
  validates_presence_of :post_id, :image
  mount_uploader :image, ImageUploader
end
