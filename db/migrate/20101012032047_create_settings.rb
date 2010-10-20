class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :production_email
      t.text   :about_us

      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
