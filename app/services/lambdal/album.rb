module Lambdal
  module Album

    def get_albums mytype
      path = "#{BASE_URL}album?album=#{mytype}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def rebuild_album
      path = "#{BASE_URL}album_rebuild?album=#{mytype}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def train_album

    end
  end
end
