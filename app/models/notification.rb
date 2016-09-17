class Notification < ActiveRecord::Base

  include NotificationConcern

  belongs_to :user
  belongs_to :notifiable, polymorphic: true

  enum kind: [:friendship_request, :friendship_accept]

  scope :read, -> { where('read = ?', true).order(created_at: :desc) }
  scope :not_read, -> { where('read = ?', false).order(created_at: :desc) }

end
