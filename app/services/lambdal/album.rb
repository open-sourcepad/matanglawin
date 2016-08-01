module Lambdal
  module Album

    def get_album mytype
      path = "#{BASE_URL}album?album=#{ENV.fetch("#{mytype}_NAME")}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def rebuild_album mytype
      path = "#{BASE_URL}album_rebuild?album=#{ENV.fetch("#{mytype}_NAME")}&albumkey=#{ENV.fetch("#{mytype}_KEY")}"
      perform_get path
    end

    def train_album mytype, lambdal_id="mil", image_path=Rails.root.join("public","images",'mil.jpg')
      path = "#{BASE_URL}album_train"
      attachment = Attachment.create image: File.open(image_path)
      params= {
        album: ENV.fetch("#{mytype}_NAME"),
        albumkey: ENV.fetch("#{mytype}_KEY"),
        entryid: lambdal_id,
        urls: "#{ENV.fetch("BASE_URL")}#{attachment.image.url}"
      }
      response = perform_post path, params
      #attachment.destroy
      response
    end

    def get_entry mytype, entry_id
      album = get_album(mytype)
      album[:body]["visualization"].select{|e| e["entryid"] == entry_id}.first
    end
  end
end
