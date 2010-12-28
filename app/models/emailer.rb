class Emailer < ActionMailer::Base
  
  def inquiry(name,email,message,subject='General Inquiry')
    setup_email
    @subject = "[CebuCondoListings] #{subject}"
    @body[:message] = message
  end
  
  private
  
  def setup_email
    @recipients = find_production_email
    @bcc = find_bcc_emails
    @sent_on = Time.now
    @content_type = "text/html"
    @headers['From'] = 'no-reply@cebucondolistings.com'
    @headers['Reply-To'] = ''
  end
  
  def find_production_email
    Setting.first.production_email
  end
  
  def find_bcc_emails
  	Setting.first.bcc
  end
end
