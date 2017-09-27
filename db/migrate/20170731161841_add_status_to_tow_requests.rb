class AddStatusToTowRequests < ActiveRecord::Migration[5.1]
  def change
    add_column :tow_requests, :status, :string, default: 'Pending', null: false
  end
end
