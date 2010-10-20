class HomeController < ApplicationController
  def index
    @developers = Developer.all
  end

  def about
    @about_us = Setting.first.about_us
  end
  
  def contact_us
    @contact = Contact.new
    return unless request.post?
    if verify_recaptcha
      @contact = Contact.create(params[:contact])
      if @contact.save
        flash[:notice] = "Your message has been sent. We will get back to you shortly"
        redirect_to contact_us_url
      else
        flash[:error] = "Unable to send message. Please check your entries"
        render :action => "contact_us"
      end
    else
      flash[:error] = "There was an error with the code you entered. Please try again"
      render :action => 'contact_us'
    end
  end
end
