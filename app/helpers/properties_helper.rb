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
  
  def display_all_unit_prices(unit_prices)
    html  = "<ul>"
    unit_prices.each {|price| html += "<li>#{price}</li>"}
    html += "</ul>"
    html
  end
  
  def display_unit_info(units)
    html = "<table><thead><tr><th>Unit Type</th><th>Unit Size</th><th>Unit Price</th><th>Monthly</th></tr></thead><tbody>"
    units.each do |u|
      html += "<tr>"
      html += "<td>#{u[0]}</td><td>#{u[2]}</td><td>#{u[1]}</td><td></td>"
      html += "</tr>"
    end
    html += "</tbody></table>"
    html
  end
end
