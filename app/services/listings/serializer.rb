module Listings
  class Serializer
    attr_accessor :object
    def initialize object
      @object = object
    end

    def serializable_hash
      hash = @object.attributes
      hash
    end

    def serializable_group_hash candidates
      collection = []
      @object.each do |o|
        hash = o.attributes
        hash["image_url"] = o.image_url
        hash["match"] = candidates[o.lambdal_id]
        collection << hash
      end
      collection.sort_by{|object| -object["match"].to_f}
    end
  end
end
