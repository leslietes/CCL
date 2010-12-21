class CondominiumsController < ApplicationController

	before_filter :inquiry_form, :only => 'index'
	
	layout "properties"
	
	private
	
	def inquiry_form
		@contact = Contact.new
	end

end
