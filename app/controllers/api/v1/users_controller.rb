class Api::V1::UsersController < ApiController
  def listing_history
    render_collection current_user.listings.order("created_at desc")
  end
end
