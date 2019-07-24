class Admin::EventsController < Admin::BaseController
  before_action :require_admin

  def index
    @events = Event
              .all
              .group_by { |e| e.event_date.beginning_of_month }
              .sort_by { |k, _v| k }
              .reverse
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "New event created"
      redirect_to admin_events_path
    else
      render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "Event updated"
      redirect_to admin_events_path
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to admin_events_path
  end

  def set_homepage
    event = Event.find(params[:id])
    event.toggle!(:on_homepage)
    redirect_to admin_events_path
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :event_date, :start_time, :end_time, :event_image, :on_homepage, :url, :pdf, :pdf_title)
  end
end
