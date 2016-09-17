class Invitation < ActiveRecord::Base
  belongs_to :inviting, class_name: 'User'
  belongs_to :invitee, class_name: 'User'
end
