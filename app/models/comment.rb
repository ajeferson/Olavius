class Comment < ActiveRecord::Base

  include CommentConcern

  belongs_to :user
  belongs_to :post

  validates_presence_of :body

end
