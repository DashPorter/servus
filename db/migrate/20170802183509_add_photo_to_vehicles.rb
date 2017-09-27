class AddPhotoToVehicles < ActiveRecord::Migration[5.1]
  def change
    add_column :vehicles, :start_photo, :string, default: ''
    add_column :vehicles, :end_photo, :string, default: ''
  end
end
