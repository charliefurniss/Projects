class AddMaturityToNote < ActiveRecord::Migration
  def change
    add_column :notes, :maturity, :string
  end
end
