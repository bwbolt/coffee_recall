class CreateBag < ActiveRecord::Migration[5.2]
  def change
    create_table :bags do |t|
      t.string :name
      t.boolean :ground
      t.integer :size

      t.timestamps
    end
  end
end
