class Subscription < ActiveRecord::Base
  
  validates_presence_of :email, :full_name
  validates_length_of   :email,:within => 3..100
  validates_format_of   :email,:with => /^([A-Z0-9._+%-])+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i
  
end
