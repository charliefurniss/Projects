class AddDrunkToBottles < ActiveRecord::Migration
  def change
    add_column :bottles, :drunk, :boolean
  end
end
