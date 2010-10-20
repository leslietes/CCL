class Developer < ActiveRecord::Base
  
  has_many :properties
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "50x68>" },
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"
  
  validates_presence_of :developer, :permalink, :description
  validates_uniqueness_of :permalink
  
  #validates_attachment_presence :photo  

  def to_param
    permalink
  end
end
