class CreateTowns < ActiveRecord::Migration[5.2]
  def change
    create_table :towns do |t|
    	t.string :townname
	  	t.integer :state_id
	  	t.string :slug
    	t.timestamps
    end
  end
end
