class Setting < ActiveRecord::Base
  
  validates_presence_of :production_email
  
  has_attached_file :featured1, :url => "/images/featured/:basename.:extension"
  has_attached_file :featured2, :url => "/images/featured/:basename.:extension"
  has_attached_file :featured3, :url => "/images/featured/:basename.:extension"
  has_attached_file :featured4, :url => "/images/featured/:basename.:extension"
  has_attached_file :featured5, :url => "/images/featured/:basename.:extension"
  
  def self.unit_types
    [['Studio','studio'],['1 Bedroom','one_bedroom'],['2 Bedroom', 'two_bedroom'],['3 Bedroom','three_bedroom'],['Loft', 'loft'],['Penthouse','penthouse']]
  end
  
end
