class AddPaymentToTowRequests < ActiveRecord::Migration[5.1]
	def change
		add_column :tow_requests, :payment_amount, :float
		add_column :tow_requests, :payment_status, :string, default: ''
	end
end
