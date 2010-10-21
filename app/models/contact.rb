class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  validates_length_of   :email,:within => 3..100
  validates_format_of   :email,:with => /^([A-Z0-9._+%-])+@([A-Z0-9-]+\.)+[A-Z]{2,4}$/i
  #validates_format_of   :contact_no, :with => /[0-9]{10}/, :if => :contact_no_available
  
  after_save :send_email
  
  def send_email
    Emailer.deliver_inquiry(self.name,self.email,self)
  end
  
  private
  
  #def contact_no_available
  #  !contact_no.blank?
  #end
end
