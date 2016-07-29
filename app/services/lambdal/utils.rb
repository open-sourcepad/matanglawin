module Lambdal
  module Utils
    require 'unirest'
    def perform_get path, params
      response = Unirest.get BASE_URL+path, parameters: params, headers: get_headers
      binding.pry
    end

    def get_headers
      {
        "X-Mashape-Key" => ENV.fetch('MASHAPE_KEY'),
        "Accept" => "application/json"
      }
    end
  end
end
