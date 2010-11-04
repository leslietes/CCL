class CreateSubscriptions < ActiveRecord::Migration
  def self.up
    create_table :subscriptions do |t|
      t.string :full_name, :email
      t.text :details
      t.timestamps
    end
  end

  def self.down
    drop_table :subscriptions
  end
end
