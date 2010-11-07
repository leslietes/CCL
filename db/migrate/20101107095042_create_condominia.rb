class CreateCondominia < ActiveRecord::Migration
  def self.up
    create_table :condominia do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :condominia
  end
end
