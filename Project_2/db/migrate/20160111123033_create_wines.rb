class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :producer
      t.string :name
      t.integer :vintage
      t.string :region
      t.string :country
      t.text :grape
      t.string :maturity

      t.timestamps null: false
    end
  end
end
