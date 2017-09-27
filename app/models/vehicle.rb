require_relative '../uploaders/start_photos_uploader'
require_relative '../uploaders/end_photos_uploader'

class Vehicle < ActiveRecord::Base
  belongs_to :tow_request

  mount_uploader :start_photo, StartPhotosUploader
  mount_uploader :end_photo, EndPhotosUploader
end