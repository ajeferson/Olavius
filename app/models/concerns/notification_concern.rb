module NotificationConcern extend ActiveSupport::Concern

  def message
    return 'enviou-lhe uma solicitação de amizade' if friendship_request?
  end

  def image
    return notifiable.profile_picture if friendship_request?
  end

  def target_name
    return notifiable.short_name if friendship_request?
  end

  def time
    I18n.localize(self.created_at, format: :short)
  end

end