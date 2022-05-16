class RenamenameToNameInBags < ActiveRecord::Migration[5.2]
  def change
    rename_column :bags, :name, :name
  end
end
