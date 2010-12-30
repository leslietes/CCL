class ContactsController < ApplicationController
  
  before_filter :login_required, :only => [:index, :destroy]
  
  def index
    @contacts = Contact.find(:all, :order => "created_at ASC")
    render :layout => "properties"
  end
  
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(params[:contact])
    
    #if verify_recaptcha
      if @contact.save
        flash[:notice] = "Your message has been sent. We will get back to you shortly."
        case params[:from]
          when "Contact Us"
            redirect_to new_contact_url
          when 'Pre Owned'
          	redirect_to condominiums_url
          when 'Rental'
          	redirect_to rentals_url
          else
            redirect_to property_url(params[:from])
        end
      else
        flash[:error] = "Unable to send message. Please check your entries."
        render :action => "new"
      end
    #else
    #  flash[:error] = "There was an error with the code you entered. Please try again"
    #  render :action => 'new'
    #end
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
