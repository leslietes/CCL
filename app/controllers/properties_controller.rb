class PropertiesController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show, :gallery, :search]
  before_filter :developers, :only => [:new,:create,:edit,:update]
  before_filter :select_unit_types, :only => [:new, :create, :edit, :update]
  before_filter :select_locations,  :only => [:new, :create, :edit, :update]
  before_filter :select_price_range,:only => [:new, :create, :edit, :update]
  before_filter :inquiry_form, :only => [:show, :gallery]
  
  #layout "application", :only => [:search] # :application doesn't work
  layout "properties", :except => [:search]
  
  def index
    if logged_in?
      @properties = Property.show_all
    else
      @properties = Property.show_all_visible  
    end
  end
  
  def show
    @partial  = 'information'
    @property = Property.find_by_permalink(params[:id])
  end
  
  def gallery
    @partial  = 'gallery'
    @property = Property.find_by_permalink(params[:id])
    render :template => 'properties/show'
  end
  
  def new
    @property = Property.new
  end
  
  def create
    @property = Property.new(params[:property])
    if @property.save
      flash[:notice] = "Successfully created property"
      redirect_to @property
    else
      flash[:error] = "Unable to created property. Please check your entries"
      render :action => 'new'
    end
  end
  
  def edit
    @property = Property.find_by_permalink(params[:id])
  end
  
  def update
    @property = Property.find_by_permalink(params[:id])
    if @property.update_attributes(params[:property])
      flash[:notice] = "Successfully updated property"
      redirect_to property_url(@property)
    else
      flash[:error] = "Unable to update property. Please check your entries"
      render :action => 'edit'
    end
  end
  
  def destroy
    @property = Property.find_by_permalink(params[:id])
    if @property.destroy
      flash[:notice] = "Successfully deleted property"
    else
      flash[:error] = "Error in deleting property"
    end
    redirect_to properties_url
  end
  
  def search
    unit_type = params[:unit_type]
    location  = params[:location]
    price_range = params[:price_range]
    
    conditions = "#{unit_type} = true" if !unit_type.blank?
    
    puts "sql: #{sql + conditions}"
    
    @properties = Property.find_by_sql("SELECT * FROM properties WHERE"  + conditions)
                                
    render :layout => "application"
  end
  
  private
  
  def developers
    developers = Developer.all
    @developers = developers.map{|d| [d.developer,d.id]}
  end
  
  def select_unit_types
    @unit_types = []
    @unit_types << ['studio']
    @unit_types << ['1 bedroom']
    @unit_types << ['2 bedroom']
    @unit_types << ['3 bedroom']
    @unit_types << ['loft']
    @unit_types << ['penthouse']
    @unit_types
  end
  
  def select_locations
    @locations = Location.all.collect{|a| a.area }
  end
  
  def select_price_range
    @price_range = PriceRange.all.sort_by{|p| p.sort_value}.collect{|p| p.range }
  end
  
  def inquiry_form
    @contact = Contact.new
  end

end
