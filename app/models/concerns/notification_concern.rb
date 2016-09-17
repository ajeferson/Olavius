module NotificationConcern extend ActiveSupport::Concern

  def message
    return 'enviou-lhe uma solicitação de amizade' if friendship_request?
    return 'aceitou sua solicitação de amizade' if friendship_accept?
  end

  def image_url
    return notifiable.profile_picture_url if friendship_request? || friendship_accept?
  end

  def target_name
    return notifiable.short_name if friendship_request? || friendship_accept?
  end

  def time
    I18n.localize(self.created_at, format: :short)
  end

end