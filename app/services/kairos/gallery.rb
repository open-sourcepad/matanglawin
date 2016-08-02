module Kairos
  module Gallery

    def get_album mytype
      path = "#{BASE_URL}album?album=#{ENV.fetch("#{mytype}_NAME")}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def enroll mytype, lambdal_id="mil", image_path=Rails.root.join("public","images",'mil.jpg')
      path = "#{BASE_URL}enroll"
      params= {
        "gallery_name" =>ENV.fetch("#{mytype}_NAME"),
        "subject_id" =>lambdal_id,
        "image" =>image_path
      }
      perform_post path, params
    end
  end
end
