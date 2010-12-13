class AddRadioButtonsToContactUs < ActiveRecord::Migration
  def self.up
    add_column :contacts, :reason, :string
  end

  def self.down
    remove_column :contacts, :reason
  end
end
