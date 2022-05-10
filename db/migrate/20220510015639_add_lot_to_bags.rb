class AddLotToBags < ActiveRecord::Migration[5.2]
  def change
    add_reference :bags, :lot, foreign_key: true
  end
end
