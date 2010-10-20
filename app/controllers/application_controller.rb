# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  before_filter :retrieve_objects
  
  def retrieve_objects
    @featured_articles = Article.featured_articles
    @properties = Property.all
    # for search box
    @locations  = Location.all(:order => "area ASC")
    @price_range= PriceRange.all(:order => "sort_value ASC")
    @unit_types = Setting.unit_types
  end
  
  protected
  
  def login_required
    if !current_user
      redirect_to root_url
    else
      return true
    end
  end
  
end
