class AddFloorCountToProperty < ActiveRecord::Migration
  def self.up
    add_column :properties, :no_of_floors, :string
    add_column :properties, :no_of_bldgs, :string
  end

  def self.down
    remove_column :properties, :no_of_floors
    remove_column :properties, :no_of_bldgs
  end
end
