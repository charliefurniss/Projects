class AddNoseToNote < ActiveRecord::Migration
  def change
    add_column :notes, :appearance, :text
    add_column :notes, :nose, :text
    add_column :notes, :palate, :text
    add_column :notes, :conclusion, :text
  end
end
