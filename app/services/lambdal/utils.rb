module Lambdal
  module Utils
    def perform_get path
      response = RestClient::Request.execute(method: :get, url: path, headers: get_headers)
      {
        code: response.code,
        body: JSON.parse(response)
      }
    end

    def get_headers
      {
        "X-Mashape-Key" => ENV.fetch('MASHAPE_KEY'),
        "Accept" => "application/json"
      }
    end
  end
end
