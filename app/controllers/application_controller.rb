# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  before_filter :menu_css
  before_filter :retrieve_objects
  
  def retrieve_objects
    @featured_articles = Article.featured_articles
    # for search box
    @search_location = Location.all.collect{|a| a.area }.sort.insert(0,"")
    @search_price    = PriceRange.show_all.insert(0,"")
    @search_type     = Setting.unit_types.insert(0,"")
    @type            = Property.property_types #condominium/condotel
    @contact_no      = Setting.first.contact_no
    @production_email= Setting.first.production_email
  end
  
  protected
  
  def menu_css
    @class = params[:controller]
  end
  
  def login_required
    if !current_user
      redirect_to root_url
    else
      return true
    end
  end
  
end
