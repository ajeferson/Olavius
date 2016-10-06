class Post < ActiveRecord::Base

  include PostConcern

  belongs_to :user
  has_many :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :reports, dependent: :destroy
  has_many :notifications, as: :notifiable, dependent: :destroy
  belongs_to :group

  accepts_nested_attributes_for :images

  validates_presence_of :title

  scope :not_in_a_group, -> {
    where('group_id is NULL').order(title: :asc)
  }

end
