class LikesController < ApplicationController

  load_and_authorize_resource :post
  load_and_authorize_resource :like, through: :post, shallow: true

  # POST /posts/:post_id/likes
  def create
    @like.user = current_user
    @like.save
  end

  # DELETE /posts/:id
  def destroy
    @like.destroy
  end

end
