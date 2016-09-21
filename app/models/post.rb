class Post < ActiveRecord::Base

  include PostConcern

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy

  accepts_nested_attributes_for :images

  validates_presence_of :title

end
