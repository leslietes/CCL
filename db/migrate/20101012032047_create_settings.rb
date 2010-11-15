class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :production_email
      t.text   :about_us

      t.string   :featured1_file_name
      t.string   :featured1_content_type
      t.integer  :featured1_file_size
      t.datetime :featured1_updated_at
      t.string   :featured1_caption
      t.string   :featured1_link
      
      t.string   :featured2_file_name
      t.string   :featured2_content_type
      t.integer  :featured2_file_size
      t.datetime :featured2_updated_at
      t.string   :featured2_caption
      t.string   :featured2_link

      t.string   :featured3_file_name
      t.string   :featured3_content_type
      t.integer  :featured3_file_size
      t.datetime :featured3_updated_at
      t.string   :featured3_caption
      t.string   :featured3_link
      
      t.string   :featured4_file_name
      t.string   :featured4_content_type
      t.integer  :featured4_file_size
      t.datetime :featured4_updated_at
      t.string   :featured4_caption
      t.string   :featured4_link
      
      t.string   :featured5_file_name
      t.string   :featured5_content_type
      t.integer  :featured5_file_size
      t.datetime :featured5_updated_at
      t.string   :featured5_caption
      t.string   :featured5_link
      
      t.string   :sidebar_file_name
      t.string   :sidebar_content_type
      t.string   :sidebar_file_size
      t.string   :sidebar_updated_at
      t.string   :sidebar_caption
      t.string   :sidebar_link
      
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
