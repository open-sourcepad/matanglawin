module Kairos
  module Recognition
    def recognize mytype, url
      path = "#{BASE_URL}recognize"
      params= {
        gallery_name: ENV.fetch("#{mytype}_NAME"),
        image: url
      }
      perform_post path, params
    end
  end
end
