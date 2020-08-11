class AddDefaultValueToDeliveryStatus < ActiveRecord::Migration[6.0]
  def change
    change_column_default :carts, :delivery_status, 0
  end
end
