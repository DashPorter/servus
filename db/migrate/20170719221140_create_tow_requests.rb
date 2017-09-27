class CreateTowRequests < ActiveRecord::Migration[5.1]
  def change
  	create_table :tow_requests do |t|
      t.string :starting_location
      t.string :current_location
      t.string :final_location
      t.belongs_to :driver, index: true
      
      t.timestamps
    end
  end
end
