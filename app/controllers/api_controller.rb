class ApiController < ActionController::Base
  include CommonResponses
  include Authenticator
  protect_from_forgery with: :null_session
  before_action :check_auth_token
end
