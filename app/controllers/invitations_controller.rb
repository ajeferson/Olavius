class InvitationsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_resource :invitation, only: [:destroy, :accept]
  before_action :load_invitation, only: [:create]
  authorize_resource :invitation

  # POST /users/:user_id/invitations
  def create
    @invitation.save
    head 201
  end

  # DELETE /invitations/:id
  def destroy
    @invitation.destroy
    head 200
  end

  # POST /invitations/:id/accept
  def accept
    current_user.friendships_b.create(user_a: @invitation.inviting)
    @invitation.destroy
    head 200
  end

  private

  def load_invitation
    @invitation = @user.host_invitations.build(invitation_params)
  end

  def invitation_params
    params.require(:invitation).permit(:invitee_id)
  end

end
