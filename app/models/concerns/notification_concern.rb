module NotificationConcern extend ActiveSupport::Concern

  def message
    return 'enviou-lhe uma solicitação de amizade' if friendship_request?
    return 'aceitou sua solicitação de amizade' if friendship_accept?
    return 'comentou na sua publicação' if comment?
    return 'curtiu sua publicação' if like?
  end

  def image_url
    return notifiable.profile_picture_url if friendship_request? || friendship_accept?
  end

  def target_name
    return target.short_name
  end

  def time
    I18n.localize(self.created_at, format: :short)
  end

end