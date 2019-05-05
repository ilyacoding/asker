module ApplicationHelper
  def formatted_date(date)
    l(date, format: "%H:%M, %-d %b")
  end
end
