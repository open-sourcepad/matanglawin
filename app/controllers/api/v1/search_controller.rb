class Api::V1::SearchController < ApiController
  before_action :get_listing, only: [:lost, :found]

  def lost
    lambdal = Lambdal::Client.new.recognize("LOST", @listing.image_url)
    collection = query_by_listing(lambdal)
    render_collection collection
  end

  def found
    lambdal = Lambdal::Client.new.recognize("FOUND", @listing.image_url)
    collection = query_by_listing(lambdal)
    render_collection collection
  end

  private

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def query_by_listing lambdal_results
    begin
      results = lambdal_results[:body]["photos"].first["tags"].first["uids"]
      results = results.each{|result| result["uid"].gsub!(/@\w+/,"")}
      uids = results.map{|result| result["uid"]}
      format_listing(Listing.where(lambdal_id: uids), results)
    rescue
      []
    end
  end

  def format_listing listings, results
    Listings::Serializer.new(listings).serializable_group_hash(results)
  end
end


