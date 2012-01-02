class AddtlProAddtlPropertyFields < ActiveRecord::Migration
  def self.up
    add_column :properties, :sold_out, :boolean, :default => false
    add_column :properties, :preselling, :boolean, :default => false
  end

  def self.down
    remove_column :properties, :sold_out
    remove_column :properties, :preselling
  end
end
