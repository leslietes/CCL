class CreateProperties < ActiveRecord::Migration
  def self.up
    create_table :properties do |t|
      t.integer :developer_id, :default => 0
      t.string :name
      t.string :permalink
      t.text :address
      t.string :location
      
      t.boolean :completed, :default => false
      t.string :target_completion_date
      
      t.text :description
      t.text :unit_types
      t.boolean :studio
      t.boolean :one_bedroom
      t.boolean :two_bedroom
      t.boolean :three_bedroom
      t.boolean :penthouse
      t.boolean :loft
      
      t.text :unit_sizes
      t.string :studio_size
      t.string :one_bedroom_size
      t.string :two_bedroom_size
      t.string :three_bedroom_size
      t.string :penthouse_size
      t.string :loft_size
      
      t.text :price_range
      t.float :studio_price
      t.float :one_bedroom_price
      t.float :two_bedroom_price
      t.float :three_bedroom_price
      t.float :penthouse_price
      t.float :loft_price
      
      t.float :studio_monthly
      t.float :one_bedroom_monthly
      t.float :two_bedroom_monthly
      t.float :three_bedroom_monthly
      t.float :penthouse_monthly
      t.float :loft_monthly

      t.text :amenities
      t.text :features
      t.text :unit_specifications
      t.text :payment_terms
      t.string :as_low_as
      t.string :as_low_as_label
      t.string :reservation_fee
      t.string :property_type
      t.boolean :featured, :default => false
      t.boolean :hidden, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :properties
  end
end
