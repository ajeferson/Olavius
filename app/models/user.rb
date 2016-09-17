class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserConcern

  validates_presence_of :name

  enum role: [:user, :admin]

  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :posts, dependent: :destroy
  has_many :guest_invitations, foreign_key: 'invitee_id', class_name: 'Invitation'
  has_many :host_invitations, foreign_key: 'inviting_id', class_name: 'Invitation'


  scope :search, -> (query)  {
    where('lower(name) LIKE :query OR lower(email) LIKE :query',
          query: "%#{(query || '').downcase}%")
        .order(name: :asc)
  }

end
