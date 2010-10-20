class Article < ActiveRecord::Base
  validates_presence_of :title, :permalink, :body
  
  def self.featured_articles
    Article.find(:all, :conditions => ["featured = ?", true], :limit => 5, :order => "created_at DESC")
  end
  
  def to_param
    permalink
  end
end
