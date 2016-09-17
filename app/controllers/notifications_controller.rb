class NotificationsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :notification, through: :user

  # GET users/:user_id/notifications
  def index
    @notifications = @notifications.order(created_at: :desc)
  end

  # POST users/:user_id/notifications/clear
  def clear
    @notifications.each do |notification|
      notification.update(read: true)
    end
  end

end
