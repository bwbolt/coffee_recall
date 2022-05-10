class CreateLot < ActiveRecord::Migration[5.2]
  def change
    create_table :lots do |t|
      t.string :name
      t.integer :lot_number
      t.string :importer
      t.boolean :organic

      t.timestamps
    end
  end
end
