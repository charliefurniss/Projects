class RemoveMaturityFromWine < ActiveRecord::Migration
  def change
    remove_column :wines, :maturity, :string
  end
end
