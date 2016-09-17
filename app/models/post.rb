class Post < ActiveRecord::Base

  include PostConcern

  belongs_to :user
  has_many :images, dependent: :destroy

  accepts_nested_attributes_for :images

  validates_presence_of :title

end
