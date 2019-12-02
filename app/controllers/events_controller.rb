class EventsController < ApplicationController
  def index
    @events = Event
              .with_attached_pdf
              .all
              .group_by { |e| e.event_date.beginning_of_month }
              .sort_by { |k, _v| k }
  end
end
