class ProductPic < ActiveRecord::Base
  belongs_to :product
  mount_uploader :image, ProductPicUploader
end
