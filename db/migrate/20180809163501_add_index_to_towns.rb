class AddIndexToTowns < ActiveRecord::Migration[5.2]
  def change
  	add_index :towns, :townname
  	add_index :towns, :id
  end
end
