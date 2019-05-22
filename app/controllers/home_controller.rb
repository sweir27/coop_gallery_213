class HomeController < ApplicationController
  def index
    @current_shows = Show.where("start_date <= ? AND end_date >= ?", Date.today, Date.today).order(start_date: :asc)
    @events = Event.where(:on_homepage => true).sort_by(&:event_date)
    @announcements = Announcement.all
    @artists = User.all.order(:slug)
  end
end
