module ApplicationHelper
  
  def hdate(date)
    return if date.blank?
    date.strftime("%Y/%m/%d %H:%M")
  end
  
end
