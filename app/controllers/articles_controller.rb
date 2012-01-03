class ArticlesController < ApplicationController
  
  before_filter :login_required, :except => [:index, :show]
  #layout "properties", :except => [:index, :show]
  
  def index
    @articles = Article.find(:all, :order => "created_at DESC")
    render :layout => "application"
  end
  
  def show
    @article = Article.find_by_permalink(params[:id])
    render :layout => "application"
  end
  
  def new
    @article = Article.new
  end
  
  def create
     @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = "Successfully created article"
      redirect_to @article
    else
      flash[:error] = "Unable to created property. Please check your entries"
      render :action => 'new'
    end
  end
  
  def edit
    @article = Article.find_by_permalink(params[:id])
  end
  
  def update
    @article = Article.find_by_permalink(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Successfully updated article"
      redirect_to article_url(@article)
    else
      flash[:error] = "Unable to update article. Please check your entries"
      render :action => 'edit'
    end
  end
  
  def destroy
    @article = Article.find_by_permalink(params[:id])
    if @article.destroy
      flash[:notice] = "Successfully deleted article"
    else
      flash[:error] = "Error in deleting article"
    end
    redirect_to articles_url
  end
end
