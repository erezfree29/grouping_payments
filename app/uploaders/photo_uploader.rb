class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  process :convert => "jpg"

  version :thumbnail do
    eager
    resize_to_fit(150, 150)
    cloudinary_transformation :quality => 80          
  end  

  # For more options, see
  # https://cloudinary.com/documentation/rails_carrierwave
end
