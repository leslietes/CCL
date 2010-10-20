class Contact < ActiveRecord::Base
  validates_presence_of :name, :email, :message
  
  after_save :send_email
  
  def send_email
    Emailer.deliver_inquiry(self.name,self.email,self)
  end
end
