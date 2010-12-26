class PropertiesController < ApplicationController
  
  before_filter :login_required,        :except => [:index, :show, :gallery, :search]
  before_filter :developers,            :only => [:new,:create,:edit,:update]
  before_filter :select_unit_types,     :only => [:new, :create, :edit, :update]
  before_filter :select_locations,      :only => [:new, :create, :edit, :update]
  before_filter :select_price_range,    :only => [:new, :create, :edit, :update]
  before_filter :select_property_types, :only => [:new, :create, :edit, :update]
  before_filter :inquiry_form,          :only => [:show, :gallery]
  
  #layout "application", :only => [:search] # :application doesn't work
  layout "properties", :except => [:search]
  
  def index
  	_projects = Property.show_all_visible
  	proj = _projects.collect{|p| p.name }.join(',')
  	
  	@page_title = "CebuCondoListings - #{proj}" 
    if logged_in?
      @properties = Property.show_all
    else
      @properties = Property.show_all_visible  
    end
  end
  
  def show
    @partial  = 'information'
    @property = Property.find_by_permalink(params[:id])
    @page_title = "CebuCondoListings - #{@property.name}, #{@property.developer_name}, #{@property.location}, Cebu"
  end
  
  def gallery
    @partial  = 'gallery'
    @property = Property.find_by_permalink(params[:id])
    @property.galleries.build
    @page_title = "CebuCondoListings - #{@property.name}, #{@property.developer_name}, #{@property.location}, Cebu"
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
  
  def upload_to_gallery
    @property = Property.find_by_permalink(params[:id])
    @property.galleries.build(params[:property][:galleries])
    
    if @property.save
      flash[:notice] = "Photo successfully uploaded"
    else
      flash[:error] = "Error"
    end
    redirect_to property_gallery_url(@property)
  end
  
  def search
    begin
      conditions = ""
      
      @location  = params[:location] 
      @unit_type = params[:unit_type]
      @prop_type = params[:type]     
      price_range = params[:price_range]
      
      if !@unit_type.blank?
        conditions +=  "#{@unit_type} = true"
      end
      
      if !@location.blank?
        conditions += " and " if !conditions.blank?
        conditions += " location = '#{@location}' "
      end
      
      if !@prop_type.blank?
        conditions += " and " if !conditions.blank?
        conditions += " property_type = '#{@prop_type}' " 
      end
      
      if !price_range.blank?
        
        pr   = PriceRange.find(price_range)
        @pr  = pr.id  # to preserve selected field
        
        from, to = pr.value_from, pr.value_to
        
        conditions += " and " if !conditions.blank?

        if @unit_type.blank?
          conditions += " ((studio_price > #{from} and studio_price < #{to}) or "
          conditions += " (one_bedroom_price > #{from} and one_bedroom_price < #{to}) or "
          conditions += " (two_bedroom_price > #{from} and two_bedroom_price < #{to}) or "
          conditions += " (three_bedroom_price > #{from} and three_bedroom_price < #{to}) or "
          conditions += " (penthouse_price > #{from} and penthouse_price < #{to}) or "
          conditions += " (loft_price > #{from} and loft_price < #{to}))"
        else
          conditions += " (#{@unit_type}_price > #{from} and #{@unit_type}_price < #{to})"
        end
      end
      puts "#{conditions}"
      @properties = Property.paginate(:all, :conditions => conditions, :page => params[:page], :include => :developer)
    rescue
      @properties = Property.paginate(:all, :select => "id, name, permalink, location, developer_id, target_completion_date, completed, studio, one_bedroom, two_bedroom, three_bedroom, penthouse, loft, as_low_as, as_low_as_label",
      								  :conditions => ["hidden = ?", false], :include => :developer, 
      								  :page => params[:page], :order => "name ASC")
    end
    
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
    @price_range = PriceRange.show_all
  end
  
  def inquiry_form
    @contact = Contact.new
  end
  
  def select_property_types
    @property_types = Property.property_types
  end

end
