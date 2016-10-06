class LikesController < ApplicationController

  load_and_authorize_resource :post
  load_and_authorize_resource :like, through: :post, shallow: true

  # POST /posts/:post_id/likes
  def create
    @like.user = current_user
    @like.save
    if !@like.post.belongs_to?(current_user)
      @like.post.user.notifications.create(notifiable: @like.post, target: current_user, kind: :like)
    end
  end

  # DELETE /posts/:id
  def destroy
    @like.destroy
  end

end
