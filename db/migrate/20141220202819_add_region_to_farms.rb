class AddRegionToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :region_id, :integer
  end
end
