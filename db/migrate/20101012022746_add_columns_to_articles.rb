class AddColumnsToArticles < ActiveRecord::Migration
  def self.up
    add_column :articles, :published_date,             :date
    add_column :articles, :published_at,               :string
    
    add_column :articles, :article_photo_file_name,    :string
    add_column :articles, :article_photo_content_type, :string
    add_column :articles, :article_photo_file_size,    :integer
    add_column :articles, :article_photo_updated_at,   :datetime
    
    add_column :articles, :article_photo_caption,      :string
  end

  def self.down
    remove_column :articles, :published_date
    remove_column :articles, :published_at
    
    remove_column :articles, :article_photo_file_name
    remove_column :articles, :article_photo_content_type
    remove_column :articles, :article_photo_file_size
    remove_column :articles, :article_photo_updated_at
    
    remove_column :articles, :article_photo_caption
  end
end
