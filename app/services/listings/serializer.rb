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
  end
end
