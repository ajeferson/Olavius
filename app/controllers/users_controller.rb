class UsersController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /home
  def home
    @feed = current_user.feed
  end

  # GET /users/:id
  def show
    @posts = @user.posts.where('group_id IS NULL').order(created_at: :desc)
  end

  # GET /users/:id/friends
  def friends
    @users = @user.friends
  end

  # PATCH /users/:id
  def update
    if @user.update(user_params)
      redirect_to user_root_path, notice: 'Perfil atualizado'
    else
      render :edit
    end
  end

  # POST /users/search
  def search
    @users = User.search(params[:search])
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to home_path, notice: 'Usuário excluído com sucesso'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_picture)
  end

end
