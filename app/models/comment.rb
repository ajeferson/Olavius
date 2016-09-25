class Comment < ActiveRecord::Base

  include CommentConcern

  belongs_to :user
  belongs_to :post
  has_one :notification, as: :notifiable, foreign_key: 'notifiable_id'

  validates_presence_of :body

end
