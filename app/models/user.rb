class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include UserConcern

  validates_presence_of :name

  enum role: [:user, :admin]

  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :posts, dependent: :destroy

  # Invitations
  has_many :guest_invitations, foreign_key: 'invitee_id', class_name: 'Invitation', dependent: :destroy      # Invitations this received
  has_many :host_invitations, foreign_key: 'inviting_id', class_name: 'Invitation', dependent: :destroy      # Invitations this user made
  has_many :inviting_users, through: :guest_invitations, source: 'inviting', class_name: 'User'              # Users that invited this user
  has_many :invited_users, through: :host_invitations, source: 'invitee', class_name: 'User'                 # Users that were invited by this user

  # Friends
  has_many :friendships_a, foreign_key: 'user_a_id', class_name: 'Friendship', dependent: :destroy           # Friendships by the user_a relation
  has_many :friendships_b, foreign_key: 'user_b_id', class_name: 'Friendship', dependent: :destroy           # Friendships by the user_b relation
  has_many :friends_b, through: :friendships_a, source: 'user_b', class_name: 'User'                         # Friends by the user_b relation
  has_many :friends_a, through: :friendships_b, source: 'user_a', class_name: 'User'                         # Friends by the user_a relation

  # Notifications
  has_many :notifications, dependent: :destroy
  has_many :targeted_notifications, class_name: 'Notification', foreign_key: 'notifiable_id', dependent: :destroy

  # Comments
  has_many :comments, dependent: :destroy

  # Likes
  has_many :likes, dependent: :destroy
  has_many :liked_posts, through: :likes, source: 'post', class_name: 'Post'

  # Reports
  has_many :reports, dependent: :destroy

  # Groups
  has_many :owned_groups, foreign_key: 'owner_id', class_name: 'Group'
  has_and_belongs_to_many :groups, class_name: 'Group'

  scope :search, -> (query)  {
    where('lower(name) LIKE :query OR lower(email) LIKE :query',
          query: "%#{(query || '').downcase}%")
        .order(name: :asc)
  }

end
