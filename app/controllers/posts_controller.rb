class PostsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :post, through: :user

  # POST /users/:user_id/posts
  def create
    if @post.save
      head 200
    else
      head 500
    end
  end


  private

  def post_params
    params.require(:post).permit(:title)
  end

end
