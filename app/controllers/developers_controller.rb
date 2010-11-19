class DevelopersController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  
  def index
    if logged_in?
      @developers = Developer.show_all
    else
      @developers = Developer.show_all_visible  
    end
  end
  
  def show
    @developer = Developer.find_by_permalink(params[:id])
  end
  
  def new
    @developer = Developer.new
  end
  
  def create
    @developer = Developer.new(params[:developer])    
    if @developer.save
      flash[:notice] = "Successfully created developer"
      redirect_to developers_url
    else
      flash[:error] = "Unable to create developer. Please check your entries"
      render :action => 'new'
    end
  end
  
  def edit
    @developer = Developer.find_by_permalink(params[:id])
  end
  
  def update
    @developer = Developer.find_by_permalink(params[:id])
    if @developer.update_attributes(params[:developer])
      flash[:notice] = "Successfully updated developer"
      redirect_to developer_url(@developer)
    else
      flash[:error] = "Unable to update developer. Please check your entries"
      render :action => 'edit'
    end
  end
  
  def destroy
    @developer = Developer.find_by_permalink(params[:id])
    if @developer.destroy
      flash[:notice] = "Successfully deleted developer"
    else
      flash[:error] = "Error in deleting developer"
    end
    redirect_to developers_url
  end
end
