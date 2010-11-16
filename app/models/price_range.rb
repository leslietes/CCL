class PriceRange < ActiveRecord::Base
  
  def self.show_all
    price_range = []
    all.sort_by{|p| p.value_from }.collect{|p| price_range << [p.range]}
    price_range
  end
end
