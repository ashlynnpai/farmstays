class AddSlugs < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string
    add_column :farms, :slug, :string
    add_column :regions, :slug, :string
  end
end
