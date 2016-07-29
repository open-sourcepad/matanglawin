module Authenticator
  extend ActiveSupport::Concern

  private

  def check_auth_token
    auth = request.headers['AuthToken']
    if auth.presence and auth == Rails.application.secrets[:secret_key_base]
      return true
    else
      render_403
    end
  end

end
