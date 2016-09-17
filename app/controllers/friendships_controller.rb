class FriendshipsController < ApplicationController

  load_and_authorize_resource :friendship

  # DELETE /friendships/:id
  def destroy
    @user = (@friendship.user_a_id == current_user.id) ? @friendship.user_b : @friendship.user_a
    @friendship.destroy
  end

end
