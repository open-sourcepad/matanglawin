class Api::V1::ListingsController < ApiController
  before_filter :get_obj, only: [:destroy, :show, :update]

  def create
    obj = current_user.listings.create(get_params)
    if obj.valid?
      process_lambdal(obj)
      render_object obj, Listings::Serializer
    else
      render_error obj
    end
  end

  def update
    if @obj.update_attributes(get_params)
      render_object @obj, Listings::Serializer
    else
      render_error @obj
    end
  end

  def destroy
    @obj.destroy
    render_success
  end

  def show
    render_object obj, Listings::Serializer
  end

  private

  def get_obj
    @obj = Listing.find(params[:id])
  end

  def get_params
    params.require(:listing).permit(
      [:name, :description, :contact, :mytype,
       :nickname, :birthday, :age]
    )
  end

  def image_param
    params.require(:listing).permit(:image)
  end

  def process_lambdal obj
    attachment = obj.create_attachment image: File.open(image_param["image"].tempfile.path)
    Kairos::Client.new.enroll(obj.mytype, obj.lambdal_id, "#{ENV.fetch("BASE_URL")}#{attachment.image.url}")
  end
end
