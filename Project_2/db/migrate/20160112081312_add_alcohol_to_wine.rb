class AddAlcoholToWine < ActiveRecord::Migration
  def change
    add_column :wines, :alcohol, :float
    add_column :wines, :window, :integer
  end
end
