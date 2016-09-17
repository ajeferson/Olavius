class InvitationsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_resource :invitation, only: [:destroy, :accept, :reject]
  before_action :load_invitation, only: [:create]
  authorize_resource :invitation

  # POST /users/:user_id/invitations
  def create
    @invitation.save
    @user = @invitation.invitee
    @user.notifications.create(notifiable: @invitation.inviting, kind: :friendship_request)
  end

  # DELETE /invitations/:id
  def destroy
    @invitation.destroy
    @user = @invitation.invitee
  end

  # POST /invitations/:id/accept
  def accept
    @user = @invitation.inviting
    current_user.friendships_b.create(user_a: @user)
    @invitation.destroy
  end

  # DELETE /invitations/:id/reject
  def reject
    @invitation.destroy
    @user = @invitation.inviting
  end

  private

  def load_invitation
    @invitation = @user.host_invitations.build(invitation_params)
  end

  def invitation_params
    params.require(:invitation).permit(:invitee_id)
  end

end
