class PreOwnedCondo < ActiveRecord::Base
	belongs_to :developer
	
	def self.show_all_visible
      PreOwnedCondo.find(:all, :select => "id, name, location, unit_type, unit_price",
                         :conditions => ["hidden = ?", false],
	                     :order => "name ASC")
	end
	
	def self.show_all
	  PreOwnedCondo.find(:all, :select => "id, name, location, unit_type, unit_price",
	                     :order => "name ASC")
	end
	
	def developer_name
	  developer.developer
	end

end
