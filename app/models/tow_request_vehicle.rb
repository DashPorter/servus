class TowRequestVehicle < ActiveRecord::Base
  belongs_to :tow_request
  belongs_to :vehicle
end