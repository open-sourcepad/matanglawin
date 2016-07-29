module CommonResponses
  extend ActiveSupport::Concern

  private

  def render_object object, serializer
    render json: serializer.new(object).serializable_hash
  end

  def render_success
    render json: {}, status: 200
  end

  def render_error object
    render json: { errors: object.errors.full_messages }, status: 400
  end

  def render_403
    render json: { error: 'Access Denied' }, status: 403
  end
end
