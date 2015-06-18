class Admin::EventsController < ApplicationController
  # GET /admin/events
  # GET /admin/events.json
  def index
    @events = Event.all.order(:start_at)
  end
end
