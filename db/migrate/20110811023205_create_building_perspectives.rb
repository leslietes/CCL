class CreateBuildingPerspectives < ActiveRecord::Migration
  def self.up
    create_table :perspectives do |t|
      t.string   :perspective_file_name
      t.string   :perspective_content_type
      t.integer  :perspective_file_size
      t.datetime :perspective_updated_at
      t.string   :caption
      t.string   :link
    end  
  end

  def self.down
    drop_table :perspectives
  end
end
