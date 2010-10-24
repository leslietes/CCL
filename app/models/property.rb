class Property < ActiveRecord::Base
  
  belongs_to :developer

  has_attached_file :photo, :styles => { :medium => "256x257>", :thumb => "100x100>" },
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

  validates_presence_of :developer_id, :name, :permalink, :location, :target_completion_date, :price_range
  validates_uniqueness_of :permalink
  
  # include hidden
  def self.show_all
    Property.all
  end
  
  # do not include hidden
  def self.show_all_visible
    Property.find(:all, :conditions => ["hidden = ?", false])
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
    types << 'Studio' if self.studio?
    types << '1 Bedroom' if self.one_bedroom?
    types << '2 Bedroom' if self.two_bedroom?
    types << '3 Bedroom' if self.three_bedroom?
    types << 'Penthouse' if self.penthouse?
    types
  end
  
end
