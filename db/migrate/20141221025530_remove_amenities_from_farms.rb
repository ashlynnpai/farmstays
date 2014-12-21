class RemoveAmenitiesFromFarms < ActiveRecord::Migration
  def change
    remove_column :farms, :amenities, :string
  end
end
