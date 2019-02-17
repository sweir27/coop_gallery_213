class HomeController < ApplicationController
  def index
    @current_show = Show.where(:current => true).first
    @events = Event.where(:on_homepage => true).sort_by(&:event_date)
    @announcements = Announcement.all
    @artists = User.all.order(:slug)
  end
end
