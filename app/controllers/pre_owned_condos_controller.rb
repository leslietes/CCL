class PreOwnedCondosController < ApplicationController
	
	before_filter :login_required, :except => [:index, :show]
	before_filter :inquiry_form,   :only => [:index, :show]
	before_filter :developers,     :only => [:new,:create,:edit,:update]
	before_filter :select_unit_types, :only => [:new, :create, :edit, :update]
	before_filter :select_locations,  :only => [:new, :create, :edit, :update]
  before_filter :select_property_types, :only => [:new, :create, :edit, :update]
    
	def index
	  if logged_in?
		@pre_owned = PreOwnedCondo.show_all
      else
        @pre_owned = PreOwnedCondo.show_all_visible
      end
	  
	  #render :layout => "properties"
	end
	
	def show
		@pre_owned = PreOwnedCondo.find_by_id(params[:id])
	end
	
	def new
		@pre_owned = PreOwnedCondo.new
	end
		
	def create
		@pre_owned = PreOwnedCondo.new(params[:pre_owned_condo])
		if @pre_owned.save
			flash[:notice] = "Successfully added property"
			redirect_to @pre_owned
		else
			flash[:error] = "Unable to create property. Please check your entries"
			render :action => 'new'
		end
	end
	
	def edit
		@pre_owned_condo = PreOwnedCondo.find_by_id(params[:id])
	end
	
	def update
		@pre_owned = PreOwnedCondo.find_by_id(params[:id])
	    if @pre_owned.update_attributes(params[:pre_owned_condo])
	      flash[:notice] = "Successfully updated property"
	      redirect_to pre_owned_condo_url(@pre_owned)
	    else
	      flash[:error] = "Unable to update property. Please check your entries"
	      render :action => 'edit'
	    end
	end
	
	def destroy
		@pre_owned = PreOwnedCondo.find_by_id(params[:id])
	    if @pre_owned.destroy
	      flash[:notice] = "Successfully deleted property"
	    else
	      flash[:error] = "Error in deleting property"
	    end
	    redirect_to pre_owned_condos_url
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
	
	  
  	def select_property_types
    	@property_types = Property.property_types
 	end
	
	def inquiry_form
		@contact = Contact.new
	end
end
