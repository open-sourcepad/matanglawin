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

    def serializable_group_hash lambdal_results
      collection = []
      @object.each do |o|
        hash = o.attributes
        hash["match"] = lambdal_results.select{|r| r["uid"] == o["lambdal_id"]}.first.to_h["confidence"]
        collection << hash
      end
      collection
    end
  end
end
