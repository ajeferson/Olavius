class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /home
  def home; end

  # GET /users/:id
  def show; end

end
