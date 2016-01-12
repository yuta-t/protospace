class Image < ActiveRecord::Base
  belongs_to :prototype

  mount_uploader :name, ImageUploader

  enum image_type: [:main, :sub]
end
