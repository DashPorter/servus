class CreateTowUsers < ActiveRecord::Migration[5.1]
  def change
  	create_table :tow_users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :type
      t.belongs_to :tow_company, index: true

      t.timestamps
    end
  end
end
