class CreateVehicles < ActiveRecord::Migration[5.1]
  def change
  	create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :year
      t.string :license_plate_number
      t.belongs_to :tow_request, index: true
            
      t.timestamps
    end
  end
end
