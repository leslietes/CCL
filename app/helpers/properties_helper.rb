module PropertiesHelper
  
  def display_all_unit_types(unit_types)
    # show form
    html  = "<ul>"
    unit_types.each {|unit| html += "<li>#{unit}</li>"}
    html += "</ul>"
    html
  end
  
  def show_all_unit_types(unit_types)
    # index list
    html = ""
    unit_types.each {|unit| html += "#{unit}<br>"}
    html 
  end
  
end
