class RemoveCopyFromNote < ActiveRecord::Migration
  def change
  	remove_column :notes, :copy
  end
end
