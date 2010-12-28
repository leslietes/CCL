class PreOwnedCondo < ActiveRecord::Base
	belongs_to :developer
	
	def developer_name
		developer.developer
	end

end
