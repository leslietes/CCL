class Property < ActiveRecord::Base
  
  belongs_to :developer

  has_attached_file :photo, :styles => { :medium => "256x257>", :thumb => "130x195>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :logo, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :location_map, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :studio_layout, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :one_bedroom_layout, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :two_bedroom_layout, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :three_bedroom_layout, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  has_attached_file :penthouse_layout, :styles => { :medium => "256x257>", :thumb => "100x100>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"

  #validates_presence_of :developer_id, :name, :permalink, :location, :target_completion_date, :price_range
  #validates_uniqueness_of :permalink
  
  # include hidden
  def self.show_all
    Property.find(:all, :order => "name ASC")
  end
  
  # do not include hidden
  def self.show_all_visible
    Property.find(:all, :conditions => ["hidden = ?", false], :order => "name ASC")
  end
  
  def self.show_all_featured
    Property.find(:all, :conditions => ["hidden = ? and featured = ?", false, true], :order => "name ASC")
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
    prices << "Studio: #{self.studio_price}"           if self.studio?
    prices << "One Bedroom: #{self.one_bedroom_price}" if self.one_bedroom?
    prices << "Two Bedroom: #{self.two_bedroom_price}" if self.two_bedroom?
    prices << "Three Bedroom: #{self.three_bedroom_price}" if self.three_bedroom?
    prices << "Penthouse: #{self.penthouse_price}"     if self.penthouse?
    prices << "Loft: #{self.loft_price}"               if self.loft?
    prices
  end
  
  def all_unit_info
    types = []
    types << ['Studio',   "#{self.studio_price}",       "#{self.studio_size}"]      if self.studio?
    types << ['1 Bedroom',"#{self.one_bedroom_price}",  "#{self.one_bedroom_size}"] if self.one_bedroom?
    types << ['2 Bedroom',"#{self.two_bedroom_price}",  "#{self.two_bedroom_size}"] if self.two_bedroom?
    types << ['3 Bedroom',"#{self.three_bedroom_price}","#{self.three_bedroom_size}"] if self.three_bedroom?
    types << ['Penthouse',"#{self.penthouse_price}",    "#{self.penthouse_size}"] if self.penthouse?
    types << ['Loft',     "#{self.loft_price}",         "#{self.loft_size}"]      if self.loft?
    types
  end
end
