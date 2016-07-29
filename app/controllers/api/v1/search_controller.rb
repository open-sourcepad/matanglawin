class Api::V1::SearchController < ApiController
  before_action :get_listing, only: [:by_listing]

  def by_listing
    get_listing
    render json: {
      lost: query_by_listing(Lambdal::Client.new.recognize("LOST", @listing.image_url)),
      found: query_by_listing(Lambdal::Client.new.recognize("FOUND", @listing.image_url))
    }, status: 200
  end

  def by_text
    render json: {
      lost: Listing.where(mytype: "LOST").full_search(params[:query]),
      found: Listing.where(mytype: "FOUND").full_search(params[:query])
    }, status: 200
  end

  private

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def query_by_listing lambdal_results
    begin
      uids = lambdal_results[:body]["photos"].first["tags"].first["uids"]
      uids = uids.map{|uid| uid["uid"].gsub(/@\w+/,"")}
      listings = Listing.search(Listing.where(lambdal_id: uids), "#{@listing.name} #{@listing.contact} #{@listing.description}")
    rescue
      []
    end
  end
end


