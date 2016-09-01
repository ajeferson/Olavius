# encoding: utf-8

class ProfilePictureUploader < MasterUploader

  def store_dir
    'uploads/users'
  end

end
