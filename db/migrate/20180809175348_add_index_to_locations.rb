class AddIndexToLocations < ActiveRecord::Migration[5.2]
  def change
  	add_index :locations, :street
    add_index :locations, :zip
  end
end
