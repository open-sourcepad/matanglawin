module Authenticator
  extend ActiveSupport::Concern

  private

  def current_user
    User.where(auth_token: request.headers['AuthToken']).first
  end

  def check_auth_token
    if !current_user
      render_403
    end
  end

end
