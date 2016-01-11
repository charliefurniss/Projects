class CreateBottles < ActiveRecord::Migration
  def change
    create_table :bottles do |t|
      t.string :wine_id
      t.string :user_id
      t.string :vendor
      t.float :price

      t.timestamps null: false
    end
  end
end
