class RemoveDrunkFromBottles < ActiveRecord::Migration
  def change
    remove_column :bottles, :drunk
    add_column :bottles, :drunk, :boolean, default: false
  end
end
