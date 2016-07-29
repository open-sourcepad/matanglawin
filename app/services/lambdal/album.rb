module Lambdal
  module Album

    def get_albums mytype
      path = "#{BASE_URL}album?album=#{mytype}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def rebuild_album mytype
      path = "#{BASE_URL}album_rebuild?album=#{mytype}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def train_album mytype
      path = "#{BASE_URL}album_train"
      params= {
        album: mytype,
        albumkey: ENV.fetch("#{mytype}_KEY"),
        entryid: 'mil',
        files: File.new(Rails.root.join("public","images",'mil.jpg'))
      }
      perform_post path, params
    end
  end
end
