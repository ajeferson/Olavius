class FriendshipsController < ApplicationController

  load_and_authorize_resource :friendship

  def destroy
    @friendship.destroy
    head 200
  end

end
