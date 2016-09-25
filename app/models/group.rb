class Group < ActiveRecord::Base

  include GroupConcern

  belongs_to :owner, class_name: 'User', inverse_of: :groups
  has_and_belongs_to_many :users
  has_many :posts

end
