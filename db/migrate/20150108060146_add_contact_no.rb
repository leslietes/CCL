class AddContactNo < ActiveRecord::Migration
  def self.up
    add_column :settings, :contact_no, :string
  end

  def self.down
    remove_column :settings, :contact_no
  end
end
