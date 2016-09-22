class GroupsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :owner, class: 'User', only: [:new, :create]
  load_and_authorize_resource :group, through: :owner, shallow: true, only: [:new, :create]

  load_and_authorize_resource :user, except: [:new, :create]
  load_and_authorize_resource :group, through: :user, shallow: true, except: [:new, :create]

  # GET /users/:user_id/groups
  def index
    @groups = @user.all_groups
  end

  # POST /users/:user_id/groups
  def create
    if @group.save
      redirect_to group_path(@group), notice: 'Grupo criado com sucesso'
    else
      render :new
    end
  end

  # PATCH /groups/:id
  def update
    if @group.update(group_params)
      redirect_to group_path(@group), notice: 'Informações atualizadas com sucesso'
    else
      render :edit
    end
  end

  # DELETE /groups/:id
  def destroy
    @group.destroy
    redirect_to user_groups_path(current_user), notice: 'Grupo excluído com sucesso'
  end

  # POST /groups/:id/join
  def join
    @group.users << current_user
    @group.reload
  end

  # DELETE /groups/:id/leave
  def leave
    @group.users.delete(current_user)
    @group.reload
  end

  # GET /groups/:id/members
  def members
    @members = @group.all_members
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
