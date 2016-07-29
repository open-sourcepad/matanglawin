module Lambdal
  module Recognition
    def recognize mytype, url
      path = "#{BASE_URL}recognize"
      params= {
        album: mytype,
        albumkey: ENV.fetch("#{mytype}_KEY"),
        urls: url
      }
      perform_post path, params
    end
  end
end
