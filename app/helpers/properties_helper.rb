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
  
  def show_all_unit_prices(unit_prices)
    # index list
    html = ""
    unit_prices.each {|price| html += "#{number_to_currency(price, :unit => "", :precision => 0)}<br>"}
    html
  end
  
  def display_all_unit_prices(unit_prices)
    # used where?
    html  = "<ul>"
    unit_prices.each {|price| html += "<li>#{number_to_currency(price)}</li>"}
    html += "</ul>"
    html
  end
  
  #def display_unit_info(units)
  #  # show page
  #  html = "<table><thead><tr><th>Unit Type</th><th>Unit Size</th><th>Unit Price*</th><th>Layouts</th></tr></thead><tbody>"
  #  units.each do |u|
  #    html += "<tr>"
  #    html += "<td>#{u[0]}</td><td>#{u[2]}</td><td>#{number_to_currency(u[1], :unit => "", :precision => 0)}</td>"
  #    html += "<td>#{u[3]}</td>"
  #    html += "</tr>"
  #  end
  #  html += "</tbody></table>"
  #  html
  #end
  
  def display_unit_info(units)
    # show page
    html = "<table><thead><tr><th>Unit Type</th><th>Unit Size</th><th>Unit Price*</th></tr></thead><tbody>"
    units.each do |u|
      html += "<tr>"
      html += "<td>#{u[0]}</td><td>#{u[2]}</td><td>#{number_to_currency(u[1], :unit => "", :precision => 0)}</td>"
      html += "</tr>"
    end
    html += "</tbody></table>"
    html
  end
  
  def condotel_label(property)
    if property.condotel?
      "<span class='condotel'>condotel</span>"
    end
  end
end
