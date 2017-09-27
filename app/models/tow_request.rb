class TowRequest < ActiveRecord::Base
  has_one :vehicle, dependent: :destroy
  belongs_to :driver
end