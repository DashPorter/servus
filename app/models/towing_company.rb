class TowingCompany < ActiveRecord::Base
  has_many :dispatchers
  has_many :drivers
end