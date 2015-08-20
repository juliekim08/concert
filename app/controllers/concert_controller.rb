require 'nokogiri'
require 'open-uri'

class ConcertController < ApplicationController
  def search
    @events = Event.order(:date)
    @event = Event.new
    respond_to do |format|
      format.html { render 'search' }
      format.json { render json: @events}
    end
  end


  def results
    if params[:venue_id] == ""
      @events = Event.where("date > ? and date < ?", DateTime.strptime("#{params[:start]}", "%m/%d/%Y"), DateTime.strptime("#{params[:end]}", "%m/%d/%Y"))
    else
      @venue = Venue.find(params[:venue_id])
      @events = @venue.events.where("date > ? and date < ?", DateTime.strptime("#{params[:start]}", "%m/%d/%Y"), DateTime.strptime("#{params[:end]}", "%m/%d/%Y"))
    end
  end

  def show_info
  end

end

