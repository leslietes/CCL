class AddStartingPrice < ActiveRecord::Migration
  def self.up
    add_column :properties, :starting_price, :float
  end

  def self.down
    remove_column :properties, :starting_price
  end
end
