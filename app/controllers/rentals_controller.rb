class RentalsController < ApplicationController

	before_filter :login_required,        :except => [:index, :show, :gallery, :search]
  	before_filter :developers,            :only => [:new,:create,:edit,:update]
  	before_filter :select_unit_types,     :only => [:new, :create, :edit, :update]
  	before_filter :select_locations,      :only => [:new, :create, :edit, :update]
  	before_filter :select_property_types, :only => [:new, :create, :edit, :update]
	before_filter :inquiry_form, 		  :only => [:index, :show]  	
	
	def index
	  if logged_in?
		@rentals = Rental.show_all
 	  else
 	    @rentals = Rental.show_all_visible
 	  end
 	  
 	  render :layout => "properties"
	end
	
	def show
		@rental = Rental.find_by_id(params[:id])
	end
	
	def new
		@rental = Rental.new
	end
	
	def create
		@rental = Rental.new(params[:rental])
	    if @rental.save
	      flash[:notice] = "Successfully created property"
	      redirect_to @rental
	    else
	      flash[:error] = "Unable to created property. Please check your entries"
	      render :action => 'new'
	    end
	end
	
	def edit
		@rental = Rental.find_by_id(params[:id])
	end
	
	def update
		@rental = Rental.find_by_id(params[:id])
	    if @rental.update_attributes(params[:rental])
	      flash[:notice] = "Successfully updated property"
	      redirect_to rental_url(@rental)
	    else
	      flash[:error] = "Unable to update property. Please check your entries"
	      render :action => 'edit'
	    end
	end
	
	def destroy
		@rental = Rental.find_by_id(params[:id])
	    if @rental.destroy
	      flash[:notice] = "Successfully deleted property"
	    else
	      flash[:error] = "Error in deleting property"
	    end
	    redirect_to rentals_url
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
	
	def inquiry_form
		@contact = Contact.new
	end
	
	def select_property_types
	    @property_types = Property.property_types
	  end

end
