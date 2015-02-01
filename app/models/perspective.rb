class Perspective < ActiveRecord::Base
  
  #has_attached_file :perspective, :url => "/images/perspectives/:basename.:extension", :styles => {:medium => "360x383>"}
  has_attached_file :perspective, :url => "/images/perspectives/:basename.:extension", :styles => {:medium => "990x360>"}
  
end
