module Lambdal
  module Api

    def get_albums mytype
      path = "album"
      params = {
        album: mytype,
        albumkey: ENV.fetch("#{mytype}_KEY")
      }
      perform_get path, params
    end

  end
end
