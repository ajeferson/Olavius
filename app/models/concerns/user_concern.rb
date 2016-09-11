module UserConcern extend ActiveSupport::Concern

  def short_name
    name.split().first
  end

end