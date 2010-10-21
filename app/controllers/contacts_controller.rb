class ContactsController < ApplicationController
  
  before_filter :login_required, :only => [:index, :destroy]
  
  def index
    @contacts = Contact.all
    render :layout => "properties"
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    @contact.subject = 'General Inquiry'
    if verify_recaptcha
      if @contact.save
        flash[:notice] = "Your message has been sent. We will get back to you shortly"
        redirect_to new_contact_url
      else
        flash[:error] = "Unable to send message. Please check your entries"
        render :action => "new"
      end
    else
      flash[:error] = "There was an error with the code you entered. Please try again"
      render :action => 'new'
    end
  end
  
  def destroy
    @contact = Contact.find_by_id(params[:id])
    if @contact.destroy
      flash[:notice] = "Successfully deleted inquiry"
    else
      flash[:error] = "Error in deleting inquiry"
    end
    redirect_to contacts_url
  end
end