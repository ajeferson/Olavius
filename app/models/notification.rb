class Notification < ActiveRecord::Base

  include NotificationConcern

  belongs_to :user
  belongs_to :target, class_name: 'User', foreign_key: 'target_id'
  belongs_to :notifiable, polymorphic: true

  enum kind: [:friendship_request, :friendship_accept, :comment]

  scope :read, -> { where('read = ?', true).order(created_at: :desc) }
  scope :not_read, -> { where('read = ?', false).order(created_at: :desc) }

end
