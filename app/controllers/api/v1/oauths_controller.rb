class Api::V1::OauthsController < ApiController
  skip_before_action :check_auth_token

  def create
    social_identity = SocialIdentity.find_or_initialize_by(uid: get_params[:uid], provider: get_params[:provider])
    user = create_user
    social_identity = create_social_identity(social_identity, user)

    if !user.valid?
      render_error(user)
    elsif !social_identity.valid?
      render_error(social_identity)
    else
      render_object social_identity, SocialIdentity::Serializer
    end
  end

  private

  def create_user
    user = User.find_or_initialize_by(email: get_params[:email])
    user.assign_attributes(
      first_name: get_params[:first_name],
      last_name: get_params[:last_name],
    )
    user.save
    user
  end

  def create_social_identity social_identity, user
    social_identity.user = user
    social_identity.save
    social_identity
  end

  def get_params
    params.require(:user).permit(
      [:first_name, :last_name, :uid, :email, :provider]
    )
  end
end
