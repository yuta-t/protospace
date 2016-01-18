class Image < ActiveRecord::Base
  mount_uploader :name, ImageUploader

  enum image_type: [:main, :sub]

  belongs_to :prototype
end
