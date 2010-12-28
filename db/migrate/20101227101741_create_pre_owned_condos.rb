class CreatePreOwnedCondos < ActiveRecord::Migration
  def self.up
    create_table :pre_owned_condos do |t|
		t.integer :developer_id #, :default => 0
  		
  		t.string :name
  		t.string :permalink
  		t.text 	 :address
  		t.string :location
  		
  		t.boolean :completed #, :default => false
  		t.string :target_completion_date
  		
  		t.string :unit_type
  		t.string :unit_size
  		t.string :unit_price

		t.string :property_type  		
  		t.text :description
  		
  		t.boolean :hidden #, default => false

		t.string :owner
		t.string :email_address
		t.string :contact_info
      	
      	t.timestamps
    end
  end

  def self.down
    drop_table :pre_owned_condos
  end
end
