class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :bottle_id
      t.text :copy
      t.integer :rating

      t.timestamps null: false
    end
  end
end
