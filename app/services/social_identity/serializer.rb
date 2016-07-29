class SocialIdentity::Serializer
  attr_accessor :object
  def initialize object
    @object = object
  end

  def serializable_hash
    hash = @object.attributes
    hash["authentication_token"] = Rails.application.secrets[:secret_key_base]
    hash
  end
end
