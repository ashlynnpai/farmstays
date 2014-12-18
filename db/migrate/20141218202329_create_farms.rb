class CreateFarms < ActiveRecord::Migration
  def change
    create_table :farms do |t|
      t.string :name
      t.string :address
      t.text :description
      t.string :email
      t.string :phone
      t.string :website
      t.integer :price
      t.string :amenities
      t.timestamps
    end
  end
end
