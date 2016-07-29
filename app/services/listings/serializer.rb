module Listings
  class Serializer
    attr_accessor :object
    def initialize object
      @object = object
    end

    def serializable_hash
      @object.attributes
    end
  end
end
