class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
    	t.string :street
    	t.string :street2
    	t.string :zip
    	t.integer :town_id
    	t.timestamps
    end
  end
end
