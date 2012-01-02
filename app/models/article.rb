class Article < ActiveRecord::Base
  
  validates_presence_of :title, :permalink, :body
  
  has_attached_file :article_photo, :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  def self.featured_articles
    Article.find(:all, :select => "title,permalink,published_date,published_at", :conditions => ["featured = ?", true], :limit => 5, :order => "created_at DESC")
  end
  
  def to_param
    permalink
  end
end
