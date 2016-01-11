class RemoveWineFromBottles < ActiveRecord::Migration
  def change
    remove_column :bottles, :wine_id
    add_column :bottles, :wine_id, :integer
    remove_column :bottles, :user_id
    add_column :bottles, :user_id, :integer
  end
end
