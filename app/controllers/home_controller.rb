class HomeController < ApplicationController
  def index
    @class = 'home'
    @properties = Property.show_all_featured
    @setting = Setting.first
    #TODO: change to form_tag
    #@subscription  = Subscription.new
    @perspectives    = Perspective.all
  end

#  def about
#    @about_us = Setting.first.about_us
#  end
end