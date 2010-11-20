class Property < ActiveRecord::Base
  
  belongs_to :developer
  has_many :galleries
  
  accepts_nested_attributes_for :galleries

  has_attached_file :photo, :styles => { :medium => "800x535>", :thumb => "190x130>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :logo, :styles => { :medium => "800x535>", :thumb => "190x130>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :location_map, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :studio_layout, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :one_bedroom_layout, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :two_bedroom_layout, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :three_bedroom_layout, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :penthouse_layout, :styles => { :medium => "800x535>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  validates_presence_of :developer_id, :name, :permalink
  validates_uniqueness_of :permalink
  
   def self.property_types
    [[''],['Condominium'],['Condotel']]
  end
  
  # include hidden - index page logged in user
  def self.show_all
    Property.find(:all, :select => "name, permalink, location, target_completion_date, developer_id, completed, 
                  studio, one_bedroom, two_bedroom, three_bedroom, penthouse, loft, 
                  studio_size, one_bedroom_size, two_bedroom_size, three_bedroom_size, penthouse_size, loft_size, 
                  studio_price, one_bedroom_price, two_bedroom_price, three_bedroom_price, penthouse_price, loft_price,
                  studio_monthly, one_bedroom_monthly, two_bedroom_monthly, three_bedroom_monthly, penthouse_monthly, loft_monthly",
                  :order => "name ASC", :include => :developer)
  end
  
  # do not include hidden - index page
  def self.show_all_visible
    Property.find(:all,  :select => "name, permalink, location, target_completion_date, developer_id, completed, 
                  studio, one_bedroom, two_bedroom, three_bedroom, penthouse, loft, 
                  studio_size, one_bedroom_size, two_bedroom_size, three_bedroom_size, penthouse_size, loft_size, 
                  studio_price, one_bedroom_price, two_bedroom_price, three_bedroom_price, penthouse_price, loft_price,
                  studio_monthly, one_bedroom_monthly, two_bedroom_monthly, three_bedroom_monthly, penthouse_monthly, loft_monthly",
                  :conditions => ["hidden = ?", false], :order => "name ASC",
                  :include => :developer)
  end
  
  def self.show_all_featured
    #home_page
    Property.find(:all, :select => "id, name, permalink, target_completion_date, developer_id, photo_file_name, photo_content_type, photo_file_size, photo_updated_at, as_low_as_label, as_low_as",
                  :conditions => ["hidden = ? and featured = ?", false, true], :order => "name ASC",
                  :include => :developer)
  end
  
  def to_param
    permalink
  end
  
  def developer_name
    developer.developer
  end
  
  def completion_date
    self.completed? ? 'Completed' : self.target_completion_date
  end
  
  def all_unit_types
    types = []
    types << 'Studio'    if self.studio?
    types << '1 Bedroom' if self.one_bedroom?
    types << '2 Bedroom' if self.two_bedroom?
    types << '3 Bedroom' if self.three_bedroom?
    types << 'Penthouse' if self.penthouse?
    types << 'Loft'      if self.loft?
    types
  end
  
  def all_unit_prices
    prices = []
    prices << "#{self.studio_price}"           if self.studio?
    prices << "#{self.one_bedroom_price}" if self.one_bedroom?
    prices << "#{self.two_bedroom_price}" if self.two_bedroom?
    prices << "#{self.three_bedroom_price}" if self.three_bedroom?
    prices << "#{self.penthouse_price}"     if self.penthouse?
    prices << "#{self.loft_price}"               if self.loft?
    prices
  end
   
  def all_unit_info
    types = []
    types << ['Studio',   "#{self.studio_price}",       "#{self.studio_size}", "<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"]      if self.studio?
    types << ['1 Bedroom',"#{self.one_bedroom_price}",  "#{self.one_bedroom_size}", "<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"] if self.one_bedroom?
    types << ['2 Bedroom',"#{self.two_bedroom_price}",  "#{self.two_bedroom_size}", "<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"] if self.two_bedroom?
    types << ['3 Bedroom',"#{self.three_bedroom_price}","#{self.three_bedroom_size}","<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"] if self.three_bedroom?
    types << ['Penthouse',"#{self.penthouse_price}",    "#{self.penthouse_size}", "<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"] if self.penthouse?
    types << ['Loft',     "#{self.loft_price}",         "#{self.loft_size}", "<a href='' class='small ui-icon ui-icon-newwin'>View layout</a>"]      if self.loft?
    types
  end
  
  def has_floor_plans?
    !studio_layout_file_name.nil? || !one_bedroom_layout_file_name.nil? || !two_bedroom_layout_file_name.nil? || !three_bedroom_layout_file_name.nil? || !penthouse_layout_file_name.nil? 
  end
  
  def has_gallery?
    !galleries.empty?
  end
end
