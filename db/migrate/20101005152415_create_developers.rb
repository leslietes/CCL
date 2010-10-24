class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :developer
      t.string :permalink
      t.text :description
      t.boolean :hidden, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :developers
  end
end
