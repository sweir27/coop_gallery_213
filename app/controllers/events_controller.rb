class EventsController < ApplicationController
  def index
    @events = Event.all.group_by{|e| e.event_date.beginning_of_month}.sort_by{ |k,v| k }
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "New event created"
      redirect_to events_path
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
      redirect_to events_path
    else
      render 'edit'
    end
  end

  def destroy
    Event.find(params[:id]).destroy
    flash[:success] = "Event deleted."
    redirect_to events_url
  end

  def set_homepage
    event = Event.find(params[:id])
    event.toggle!(:on_homepage)
    redirect_to events_url
  end

  private
    def admin_user
      # store_location
      flash[:notice] = "Only administrators can create events" unless current_user && current_user.admin?
      redirect_to(root_url) unless current_user && current_user.admin?
    end

    def event_params
      params.require(:event).permit(:title, :description, :event_date, :start_time, :end_time, :event_image, :on_homepage)
    end
end
