class CreateRentals < ActiveRecord::Migration
  def self.up
  	create_table :rentals do |t|
  	  t.integer :developer_id
  	  
  	  t.string  :name
  	  t.string  :permalink
  	  t.text    :address
  	  t.string  :location
  	  
  	  t.string  :unit_type
  	  t.string  :unit_size
  	  t.string  :unit_price

	  t.text    :description
  	  
  	  t.boolean :hidden
  	  
  	  t.string  :owner
  	  t.string  :email_address
  	  t.string  :contact_info
  	  
  	  t.timestamps
    end
  end

  def self.down
    drop_table :rentals
  end
end
