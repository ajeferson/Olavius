class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserConcern

  validates_presence_of :name

  enum role: [:user, :admin]

  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :posts, dependent: :destroy

  # Invitations
  has_many :guest_invitations, foreign_key: 'invitee_id', class_name: 'Invitation'                     # Invitations this received
  has_many :host_invitations, foreign_key: 'inviting_id', class_name: 'Invitation'                     # Invitations this user made
  has_many :invitation_host_users, through: :guest_invitations, source: 'inviting', class_name: 'User' # Users that invited this user
  has_many :invitation_guest_users, through: :host_invitations, source: 'invitee', class_name: 'User'  # Users that were invited by this user

  # Friends
  has_many :friendships_a, foreign_key: 'user_a_id', class_name: 'Friendship'                          # Friendships by the user_a relation
  has_many :friendships_b, foreign_key: 'user_b_id', class_name: 'Friendship'                          # Friendships by the user_b relation
  has_many :friends_b, through: :friendships_a, source: 'user_b', class_name: 'User'                   # Friends by the user_b relation
  has_many :friends_a, through: :friendships_b, source: 'user_a', class_name: 'User'                   # Friends by the user_a relation

  scope :search, -> (query)  {
    where('lower(name) LIKE :query OR lower(email) LIKE :query',
          query: "%#{(query || '').downcase}%")
        .order(name: :asc)
  }

end
