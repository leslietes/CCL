class Emailer < ActionMailer::Base
  
  def inquiry(name,email,message,subject='No subject')
    puts "====inquiry"
    setup_email
    @subject = "[CebuCondoListings] #{subject}"
    @body[:message] = message
  end
  
  private
  
  def setup_email
    @recipients = find_production_email
    @sent_on = Time.now
    @content_type = "text/html"
    @headers['From'] = 'no-reply@example.com'
    @headers['Reply-To'] = ''
  end
  
  def find_production_email
    Setting.first.production_email
  end
end
