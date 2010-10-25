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
    # for search box
    @search_location  = Location.all.collect{|a| a.area }.sort.insert(0,"")
    @search_price  = PriceRange.all.sort_by{|p| p.sort_value }.collect{|p| [p.range,p.sort_value]}.insert(0,["",""])
    @search_type   = Setting.unit_types.insert(0,"")
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
