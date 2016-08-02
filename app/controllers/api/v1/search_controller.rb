class Api::V1::SearchController < ApiController
  before_action :get_listing, only: [:lost, :found]

  def lost
    results = Kairos::Client.new.recognize("LOST", @listing.image_url)
    collection = query_by_listing(results,ENV.fetch("LOST_NAME"))
    render_collection collection
  end

  def found
    results = Kairos::Client.new.recognize("FOUND", @listing.image_url)
    collection = query_by_listing(results,ENV.fetch("FOUND_NAME"))
    render_collection collection
  end

  private

  def get_listing
    @listing = Listing.find(params[:id])
  end

  def query_by_listing results, mytype
    begin
      candidates = results[:body]["images"].first["candidates"].to_a
      hash = {}
      candidates.each do |c|
        hash[c.keys.first] = c[c.keys.first]
      end
      ids = candidates.map{|e| e.keys.first}
      listings = Listing.where(mytype: mytype).where.not(id: @listing.id)
      listings = listings.where(lambdal_id: ids).to_a + listings.full_search("#{@listing.name} #{@listing.contact} #{@listing.description}").to_a
      listings = Listings::Serializer.new(listings.uniq).serializable_group_hash(hash)
      Rails.logger.info listings
      listings
    rescue => e
      Rails.logger.info e
      Rails.logger.info e.backtrace
      []
    end
  end
end


