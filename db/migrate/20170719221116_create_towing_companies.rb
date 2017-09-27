class CreateTowingCompanies < ActiveRecord::Migration[5.1]
  def change
  	create_table :towing_companies do |t|
      t.string :name

      t.timestamps
    end
  end
end
