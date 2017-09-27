class Driver < TowUser
  has_many   :tow_requests, dependent: :destroy
end
