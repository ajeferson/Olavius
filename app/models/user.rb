class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name

  enum role: [:user, :admin]

  mount_uploader :profile_picture, ProfilePictureUploader

end
