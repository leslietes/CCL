class AdminController < ApplicationController
  
  before_filter :login_required
  
  def settings
    @setting = Setting.first
    #TODO: sort alphabetically
    @locations= Location.all(:order => "area ASC")
    #TODO: sort
    @price_range = PriceRange.all(:order => "sort_value ASC")
  end
  
  def edit_settings
    #@setting = Setting.first
    #return unless request.post?
    #@setting.update_attributes(params[:setting])
    #if @setting.save
    #  flash[:notice] = "Updated site settings"
    #  redirect_to settings_url
    #else
    #  flash[:error] = "Unable to update site settings. Please check your entries"
    #  render :action => 'settings'
    #end
    setting = Setting.first
    setting.update_attributes(params[:setting])
    #setting.production_email = params[:production_email]
    if setting.save
      flash[:notice] = "Updated site settings"
    else
      flash[:error] = "Unable to update site settings"
    end
    redirect_to settings_url
  end
  
  def add_location
    location = Location.new(:area => params[:location])
    if location.save
      flash[:notice] = 'Successfully added location'
    else
      flash[:notice] = "Unable to add new location"
    end
    redirect_to settings_url
  end
  
  def remove_location
    if Location.exists?(params[:id])
      if Location.delete(params[:id])
        flash[:notice] = "Successfully deleted location"
      else
        flash[:error] = "Unable to delete location"
      end
    end
    redirect_to settings_url
  end
  
  def add_price_range
    price_range = PriceRange.new(:range => params[:price_range], :sort_value => params[:sort_value])
    if price_range.save
      flash[:notice] = "Successfully added price range"
    else
      flash[:notice] = "Unable to add new price range"
    end
    redirect_to settings_url
  end
  
  def remove_price_range
    if PriceRange.exists?(params[:id])
      if PriceRange.delete(params[:id])
        flash[:notice] = "Successfully deleted price range"
      else
        flash[:error] = "Unable to delete price range"
      end
    end
    redirect_to settings_url
  end
end
