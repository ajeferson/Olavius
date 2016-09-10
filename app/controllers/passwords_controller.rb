class PasswordsController < Devise::PasswordsController

  def create

    self.resource = User.send_reset_password_instructions(resource_params)

    if successfully_sent?(resource)
      redirect_to new_user_session_path, notice: t('devise.confirmations.send_instructions')
    else
      redirect_to new_user_session_path, alert: resource.errors.full_messages.first
    end

  end

end
