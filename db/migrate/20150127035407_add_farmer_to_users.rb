class AddFarmerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :farmer, :boolean
  end
end
