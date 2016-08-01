class Api::V1::SearchController < ApiController
  before_action :get_listing, only: [:lost, :found]

  def lost
    lambdal = Lambdal::Client.new.recognize("LOST", @listing.image_url)
    collection = query_by_listing(lambdal,ENV.fetch("LOST_NAME"))
    render_collection collection
  end

  def found
    lambdal = Lambdal::Client.new.recognize("FOUND", @listing.image_url)
    collection = query_by_listing(lambdal,ENV.fetch("FOUND_NAME"))
    render_collection collection
  end

  private

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def query_by_listing lambdal_results, mytype
    begin
      results = lambdal_results[:body]["photos"].first["tags"].first["uids"]
      Rails.logger.info results
      results = results.each{|result| result["uid"].gsub!(/@\w+/,"")}
      Rails.logger.info results
      uids = results.map{|result| result["uid"]}
      listings = Listing.where(mytype: mytype)
      listings = listings.where(lambdal_id: uids).to_a + listings.full_search("#{@listing.name} #{@listing.contact} #{@listing.description}").to_a
      format_listing(listings.uniq, results)
    rescue => e
      Rails.logger.info e
      Rails.logger.info e.backtrace
      []
    end
  end

  def format_listing listings, results
    Listings::Serializer.new(listings).serializable_group_hash(results)
  end
end


