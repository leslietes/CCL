class AddBccToSettings < ActiveRecord::Migration
  def self.up
  	add_column :settings, :bcc, :string
  end

  def self.down
  	remove_column :settings, :bcc
  end
end
