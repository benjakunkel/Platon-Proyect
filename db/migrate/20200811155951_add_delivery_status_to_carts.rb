class AddDeliveryStatusToCarts < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :delivery_status, :integer
  end
end
