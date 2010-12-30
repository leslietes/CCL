class Rental < ActiveRecord::Base

	def self.show_all
	  find(:all, :select => "id, name, location, unit_type, unit_price, unit_size",
	       :order => "name ASC")
	end
	
	def self.show_all_visible
	  find(:all, :select => "id, name, location, unit_type, unit_price, unit_size",
	       :conditions => ["hidden = ?", false], :order => "name ASC")
	end
	
	def has_address?
		!address.blank?
	end

end
