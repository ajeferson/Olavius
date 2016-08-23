class SettingsController < ApplicationController

  before_action :authenticate_user!

  # GET /settings
  def index; end

  # GET /settings/account
  def account; end

  # DELETE /settings/account/destroy
  def account_destroy
    user = current_user
    sign_out current_user
    user.destroy!
    redirect_to new_user_session_path
  end

end
