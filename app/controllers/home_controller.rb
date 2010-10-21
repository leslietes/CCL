class HomeController < ApplicationController
  def index
    @developers = Developer.all
  end

#  def about
#    @about_us = Setting.first.about_us
#  end