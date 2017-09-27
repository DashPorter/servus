class StartPhotosUploader < CarrierWave::Uploader::Base
  storage :file

  def content_type_whitelist
    /image\//
  end
end
