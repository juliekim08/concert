require 'nokogiri'
require 'open-uri'

class ConcertController < ApplicationController
  def search
    @events = Event.all
    @event = Event.new
    respond_to do |format|
      format.html { render 'search' }
      format.json { render json: @events}
    end
  end

   def metro
  end

  def results
    @venue = Venue.find(params[:venue_id])
  end

end

