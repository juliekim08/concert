require 'nokogiri'
require 'open-uri'

class ConcertController < ApplicationController
  def search
    @events = Event.order(:date)
    @event = Event.new
    @start = Chronic.parse(params[:start])
    @end = Chronic.parse(params[:end])
    respond_to do |format|
      format.html { render 'search' }
      format.json { render json: @events}
    end
  end

   def metro
    @events = Event.all
    @event = Event.new
  end

  def results
    @venue = Venue.find(params[:venue_id])
    @events = Event.where("date > ? and date < ?", DateTime.strptime("#{params[:start]}", "%m/%d/%Y"), DateTime.strptime("#{params[:end]}", "%m/%d/%Y"))

    @start_date = params[:start]
    @end_date = params[:end]

  end

end

