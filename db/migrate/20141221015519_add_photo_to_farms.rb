class AddPhotoToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :photo, :string
  end
end
