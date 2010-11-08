class Developer < ActiveRecord::Base
  
  has_many :properties
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "50x68>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_presence_of :developer, :permalink, :description
  validates_uniqueness_of :permalink
  
  # including hidden
  def self.show_all
    Developer.find(:all, :order => "developer ASC")  
  end
  
  # not including hidden
  def self.show_all_visible
    Developer.find(:all, :conditions => ["hidden = ?", false], :order => "developer ASC")
  end
  
  def show_all_projects
    properties.find(:all, :conditions => ["hidden = ?", false], :order => "name ASC")
    #Property.find(:all, :conditions => ["developer = ? and hidden = ?", self.id, false], :order => "name ASC")
  end

  def to_param
    permalink
  end
end
