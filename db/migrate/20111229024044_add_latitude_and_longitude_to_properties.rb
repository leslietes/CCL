class AddLatitudeAndLongitudeToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :latitude, :float
    add_column :properties, :longitude, :float
  end

  def self.down
    remove_column :properties, :longitude
    remove_column :properties, :latitude
  end
end
