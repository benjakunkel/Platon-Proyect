class AddRatingToShops < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :rating, :integer
  end
end
