class CreatePriceRanges < ActiveRecord::Migration
  def self.up
    create_table :price_ranges do |t|
      t.string :range
      t.integer :value_from, :value_to
      t.timestamps
    end
  end

  def self.down
    drop_table :price_ranges
  end
end
