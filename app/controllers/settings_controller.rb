class SettingsController < ApplicationController

  before_action :authenticate_user!

  # GET /settings
  def index; end

  # GET /settings/account
  def account; end

end
