class TowUser < ActiveRecord::Base
  has_secure_password

  belongs_to :towing_company
end