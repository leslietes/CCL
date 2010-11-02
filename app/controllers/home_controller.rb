class HomeController < ApplicationController
  def index
    @properties = Property.show_all_featured
    @setting = Setting.first
  end

#  def about
#    @about_us = Setting.first.about_us
#  end
end