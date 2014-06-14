class ImageUploader < CarrierWave::Uploader::Base

  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "imageupload/"
  end

end