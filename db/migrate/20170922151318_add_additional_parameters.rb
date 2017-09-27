class AddAdditionalParameters < ActiveRecord::Migration[5.1]
  def change
    add_column :tow_requests, :deleted_at, :datetime
    add_index :tow_requests, :deleted_at
    add_column :tow_requests, :tow_company_id, :integer
    add_column :vehicles, :color, :string, default: ''
    add_column :vehicles, :license_plate_state, :string, default: ''
    add_column :vehicles, :photos, :string, default: ''
  end
end
