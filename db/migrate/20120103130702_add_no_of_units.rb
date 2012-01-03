class AddNoOfUnits < ActiveRecord::Migration
  def self.up
    add_column :properties, :no_of_units, :string, :default => 0
  end

  def self.down
    remove_column :properties, :no_of_units
  end
end
