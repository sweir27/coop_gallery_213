class ShowsController < ApplicationController
  def ind_current
    today = Date.today

    @current_shows = Show.where("start_date <= ? AND end_date >= ?", today, today).order(start_date: :asc)
    @upcoming_shows = Show.where("start_date > ?", today).order(start_date: :asc)
    @past_shows = Show.where("end_date < ?", today).limit(20).order(start_date: :desc)
  end

  def current
    @current_show = Show.where(:current => true).first
    @events = Event.where(:on_homepage => true).sort_by(&:event_date)
    @announcements = Announcement.all
    @artists = User.all
  end

  def show
    @show = Show.find(params[:id])
  end
end
