# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    @page_title || 'CebuCondoListings'
  end
  
  def meta(name, content)
  	%(<meta name="#{name}" content="#{content} />")
  end
  
  def meta_description
  	if @property 
  		"Information on #{@property.name}. A #{@property.developer_name} project."
  	elsif @developer
  		"Information on #{@developer.developer}'s condominium projects."
  	else
  		"Premier site for the most comprehensive and up-to-date listings of new and upcoming condominium development projects in Cebu City and nearby areas."
  	end
  end
  
  def meta_keywords
  	if @property
  		[@property.name, @property.developer_name, @property.location, @property.property_type, @property.types].join(',')
  	else
  		"Cebu, condominiums, condotels, studio, one bedroom, two bedrooms, three bedrooms, penthouse, loft"
  	end
  end
  
  def format_date(date, abbreviated=false)
    return unless date
    date.strftime("%b %d, %Y")
    #date.strftime("#{abbreviated ? '%b' : '%B'} %d, %Y")
  end
  
  def format_date_with_time(date, abbreviated=false)
    return unless date
    date.strftime("%b %d, %Y %H:%M")
  end
  
  def has_featured?
    setting = Setting.first
    !setting.featured1_file_name.nil? || !setting.featured2_file_name.nil? || !setting.featured3_file_name.nil? || !setting.featured4_file_name.nil? || !setting.featured5_file_name.nil?
    
  end
end
