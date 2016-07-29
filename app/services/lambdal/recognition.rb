module Lambdal
  module Recognition
    def recognize mytype
      path = "#{BASE_URL}recognize"
      params= {
        album: mytype,
        albumkey: ENV.fetch("#{mytype}_KEY"),
        files: File.new(Rails.root.join("public","images",'rodm.jpg'))
      }
      perform_post path, params
    end
  end
end
