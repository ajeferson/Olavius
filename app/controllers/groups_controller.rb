class GroupsController < ApplicationController

  load_and_authorize_resource :owner, class: 'User'
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

  private

  def group_params
    params.require(:group).permit(:name, :description)
  end

end
