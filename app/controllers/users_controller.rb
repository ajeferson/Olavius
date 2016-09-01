class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /home
  def home
    @posts = current_user.posts.order(created_at: :desc)
  end

  # GET /users/:id
  def show; end

  # GEt /users/:id/edit
  def edit; end

  def update
    if @user.update(user_params)
      redirect_to user_root_path, notice: 'Perfil atualizado'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_picture)
  end

end
