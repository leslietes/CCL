class PropertiesController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  before_filter :developers, :only => [:new,:create,:edit,:update]
  before_filter :select_unit_types, :only => [:new, :create, :edit, :update]
  
  layout "application", :except => [:index] # :application doesn't work
  #layout "properties"
  
  def index
    @properties = Property.all
    render :layout => 'properties'
  end
  
  def show
    @property = Property.find_by_permalink(params[:id])
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
    puts "===#{params.inspect}"
    
    unit_type = params[:unit_type]
    location  = params[:location]
    price_range = params[:price_range]
    
    @properties = Property.find(:all, :conditions => "")
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
    @unit_types << ['penthouse']
    @unit_types
  end

end
