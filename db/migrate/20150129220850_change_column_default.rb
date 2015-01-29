class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :farms, :user_id, :integer, :default => 1
  end
end
