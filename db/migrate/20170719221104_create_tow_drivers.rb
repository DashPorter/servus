class CreateTowDrivers < ActiveRecord::Migration[5.1]
  def change
  	create_table :drivers do |t|
  	  t.string :name
  	  t.string :email
  	  t.string :password_digest
  	  t.belongs_to :tow_company, index: true

  	  t.timestamps
  	end
  end
end
