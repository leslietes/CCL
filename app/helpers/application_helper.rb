# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def page_title
    @page_title || 'cebucondolistings'
  end
  
  def format_date(date, abbreviated=false)
    return unless date
    date.strftime("%b %d, %Y")
    #date.strftime("#{abbreviated ? '%b' : '%B'} %d, %Y")
  end
  
  def has_featured?
    setting = Setting.first
    !setting.featured1.blank? && !setting.featured2.blank? && !setting.featured3.blank? && !setting.featured4.blank? && !setting.featured5.blank?
  end
end
