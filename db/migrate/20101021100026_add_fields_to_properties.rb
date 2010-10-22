class AddFieldsToProperties < ActiveRecord::Migration
  def self.up
    add_column :properties, :logo_file_name,    :string
    add_column :properties, :logo_content_type, :string
    add_column :properties, :logo_file_size,    :integer
    add_column :properties, :logo_updated_at,   :datetime
    
    add_column :properties, :location_map_file_name,    :string
    add_column :properties, :location_map_content_type, :string
    add_column :properties, :location_map_file_size,    :integer
    add_column :properties, :location_map_updated_at,   :datetime
    add_column :properties, :location_map_caption,      :string
    
    # floor plans
    add_column :properties, :studio_layout_file_name,    :string
    add_column :properties, :studio_layout_content_type, :string
    add_column :properties, :studio_layout_file_size,    :integer
    add_column :properties, :studio_layout_updated_at,   :datetime
    add_column :properties, :studio_layout_caption,      :string
    
    add_column :properties, :one_bedroom_layout_file_name,    :string
    add_column :properties, :one_bedroom_layout_content_type, :string
    add_column :properties, :one_bedroom_layout_file_size,    :integer
    add_column :properties, :one_bedroom_layout_updated_at,   :datetime
    add_column :properties, :one_bedroom_layout_caption,      :string
    
    add_column :properties, :two_bedroom_layout_file_name,    :string
    add_column :properties, :two_bedroom_layout_content_type, :string
    add_column :properties, :two_bedroom_layout_file_size,    :integer
    add_column :properties, :two_bedroom_layout_updated_at,   :datetime
    add_column :properties, :two_bedroom_layout_caption,      :string
    
    add_column :properties, :three_bedroom_layout_file_name,    :string
    add_column :properties, :three_bedroom_layout_content_type, :string
    add_column :properties, :three_bedroom_layout_file_size,    :integer
    add_column :properties, :three_bedroom_layout_updated_at,   :datetime
    add_column :properties, :three_bedroom_layout_caption,      :string
    
    add_column :properties, :penthouse_layout_file_name,    :string
    add_column :properties, :penthouse_layout_content_type, :string
    add_column :properties, :penthouse_layout_file_size,    :integer
    add_column :properties, :penthouse_layout_updated_at,   :datetime
    add_column :properties, :penthouse_layout_caption,      :string
  end

  def self.down
    remove_column :properties, :logo_file_name
    remove_column :properties, :logo_content_type
    remove_column :properties, :logo_file_size
    remove_column :properties, :logo_updated_at
    
    remove_column :properties, :location_map_file_name
    remove_column :properties, :location_map_content_type
    remove_column :properties, :location_map_file_size
    remove_column :properties, :location_map_updated_at
    remove_column :properties, :location_map_caption
    
    # floor plans
    remove_column :properties, :studio_layout_file_name
    remove_column :properties, :studio_layout_content_type
    remove_column :properties, :studio_layout_file_size
    remove_column :properties, :studio_layout_updated_at
    remove_column :properties, :studio_layout_caption
    
    remove_column :properties, :one_bedroom_layout_file_name
    remove_column :properties, :one_bedroom_layout_content_type
    remove_column :properties, :one_bedroom_layout_file_size
    remove_column :properties, :one_bedroom_layout_updated_at
    remove_column :properties, :one_bedroom_layout_caption
    
    remove_column :properties, :two_bedroom_layout_file_name
    remove_column :properties, :two_bedroom_layout_content_type
    remove_column :properties, :two_bedroom_layout_file_size
    remove_column :properties, :two_bedroom_layout_updated_at
    remove_column :properties, :two_bedroom_layout_caption
    
    remove_column :properties, :three_bedroom_layout_file_name
    remove_column :properties, :three_bedroom_layout_content_type
    remove_column :properties, :three_bedroom_layout_file_size
    remove_column :properties, :three_bedroom_layout_updated_at
    remove_column :properties, :three_bedroom_layout_caption
    
    remove_column :properties, :penthouse_layout_file_name
    remove_column :properties, :penthouse_layout_content_type
    remove_column :properties, :penthouse_layout_file_size
    remove_column :properties, :penthouse_layout_updated_at
    remove_column :properties, :penthouse_layout_caption
  end
end
