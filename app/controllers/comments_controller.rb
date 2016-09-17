class CommentsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post, shallow: true

  def index

  end

  # POST /posts/:post_id/comments
  def create
    @comment.save
  end

  def update

  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end

end
