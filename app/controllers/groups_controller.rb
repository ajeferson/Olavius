class GroupsController < ApplicationController

  load_and_authorize_resource :user
  load_and_authorize_resource :group, through: :user, shallow: true

  # GET /users/:user_id/groups
  def index
  end

  # POST /users/:user_id/groups
  def create
    if @group.save
      redirect_to group_path(@group), notice: 'Grupo criado com sucesso'
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
