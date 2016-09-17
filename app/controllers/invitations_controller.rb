class InvitationsController < ApplicationController

  before_action :authenticate_user!
  load_and_authorize_resource :user
  load_and_authorize_resource :invitation, through: :user, shallow: true

  # POST /users/:user_id/invitations
  def create
    @invitation.save
  end

  private

  def invitation_params
    params.require(:invitation).permit(:invitee_id)
  end

end
