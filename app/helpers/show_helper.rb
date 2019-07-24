module ShowHelper
  def formatted_show_dates(start_date, end_date)
    "#{start_date.strftime('%b %-d, %Y')} — #{end_date.strftime('%b %-d, %Y')}"
  end
end
