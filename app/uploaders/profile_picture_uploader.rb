# encoding: utf-8

class ProfilePictureUploader < MasterUploader

  def store_dir
    'uploads/users'
  end

  def default_url(*args)
    ActionController::Base.helpers.asset_path('default_profile_picture.png')
  end

end
