class Setting < ActiveRecord::Base
  
  validates_presence_of :production_email
  
  has_attached_file :featured1, :url => "/images/featured/:basename.:extension", :styles => {:medium => "612x275>"}
  has_attached_file :featured2, :url => "/images/featured/:basename.:extension", :styles => {:medium => "612x275>"}
  has_attached_file :featured3, :url => "/images/featured/:basename.:extension", :styles => {:medium => "612x275>"}
  has_attached_file :featured4, :url => "/images/featured/:basename.:extension", :styles => {:medium => "612x275>"}
  has_attached_file :featured5, :url => "/images/featured/:basename.:extension", :styles => {:medium => "612x275>"}
  has_attached_file :sidebar,   :url => "/images/sidebar/:basename.:extension",  :styles => {:medium => "290x295>"}
  
  def self.unit_types
    [['Studio','studio'],['1 Bedroom','one_bedroom'],['2 Bedroom', 'two_bedroom'],['3 Bedroom','three_bedroom'],['Loft', 'loft'],['Penthouse','penthouse']]
  end
  
  def self.types
    [['Condominium'],['Condotel']]
  end
  
end
