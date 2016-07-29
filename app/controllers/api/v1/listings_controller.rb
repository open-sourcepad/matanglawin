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
    Lambdal::Client.new.train_album(obj.mytype, obj.lambdal_id, image_param["image"].tempfile.path)
    entry = Lambdal::Client.new.get_entry(obj.mytype, obj.lambdal_id)
    Lambdal::Client.new.rebuild_album(obj.mytype)
    obj.update_attributes image_url: entry["image"]
  end
end
