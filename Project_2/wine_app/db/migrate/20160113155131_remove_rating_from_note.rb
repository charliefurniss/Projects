class RemoveRatingFromNote < ActiveRecord::Migration
  def change
    remove_column :notes, :rating, :string
    add_column :notes, :rating, :integer
  end
end
