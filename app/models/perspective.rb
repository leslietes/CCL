class Perspective < ActiveRecord::Base
  
  has_attached_file :perspective, :url => "/images/perspectives/:basename.:extension", :styles => {:medium => "290x295>"}
  
end
