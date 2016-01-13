class RemoveWindowFromWines < ActiveRecord::Migration
  def change
    remove_column :wines, :window, :integer
    add_column :wines, :window_start, :integer
    add_column :wines, :window_end, :integer
    add_column :wines, :style, :string
  end
end
