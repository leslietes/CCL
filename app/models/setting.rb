class Setting < ActiveRecord::Base
  
  validates_presence_of :production_email
  
  def self.unit_types
    ['Studio','1 Bedroom','2 Bedroom','3 Bedroom','Penthouse']
  end
  
end
