class Report < ActiveRecord::Base

  include ReportConcern

  belongs_to :user
  belongs_to :post

  enum reason: [:copyright, :nudes]

  validates_presence_of :user_id, :post_id

end
