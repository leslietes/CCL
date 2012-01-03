class Gallery < ActiveRecord::Base
  belongs_to :property
  
  has_attached_file :gallery_photo, :styles => {:medium => "335x525>"},
                    :url => "/:class/:attachment/:id/:style_:basename.:extension"
end
