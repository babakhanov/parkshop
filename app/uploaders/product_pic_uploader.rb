class ProductPicUploader < CarrierWave::Uploader::Base

  include CarrierWave::MiniMagick

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :large do
    resize_to_fill(290, 290)
  end

  version :big do
    resize_to_fill(180, 180)
  end

  version :medium do
    resize_to_fill(100, 100)
  end

  version :micro do
    resize_to_fill(36, 36)
  end

  def extension_white_list
    %w(jpg jpeg png)
  end

end
