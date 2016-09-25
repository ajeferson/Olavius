class CommentsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :post
  load_and_authorize_resource :comment, through: :post, shallow: true

  # POST /posts/:post_id/comments
  def create
    @comment.save
    @comment.post.user.notifications.create(notifiable: @comment.post, target: @comment.user, kind: :comment)
  end

  def update
    @comment.update(comment_params)
  end

  # DELETE /comments/:id
  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :body)
  end

end
