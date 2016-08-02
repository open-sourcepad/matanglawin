module Kairos
  module Utils
    def perform_get path
      begin
        Rails.logger.info "GET #{path}"
        response = RestClient::Request.execute(method: :get, url: path, headers: get_headers)
        Rails.logger.info "RESPONSE #{response.code} | BODY #{JSON.parse(response)}"
        {
          code: response.code,
          body: JSON.parse(response)
        }
      rescue => e
        Rails.logger.warn e
        Rails.logger.warn e.backtrace
        {}
      end
    end

    def perform_post path, params
      Rails.logger.info "POST #{path} | PARAMS #{params}"
      response = RestClient::Request.execute(method: :post, url: path, payload: params.to_json, headers: get_headers)
      Rails.logger.info "RESPONSE #{response.code} | BODY #{JSON.parse(response)}"
      {
        code: response.code,
        body: JSON.parse(response)
      }
    end

    def get_headers
      {
        "Content-Type" => "application/json",
        "app_id" => ENV.fetch("APP_ID"),
        "app_key" => ENV.fetch("APP_KEY")
      }
    end
  end
end
