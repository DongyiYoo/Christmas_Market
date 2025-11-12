class CreateMarkets < ActiveRecord::Migration[8.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.text :description

      t.timestamps
    end
  end
end
