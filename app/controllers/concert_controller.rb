require 'nokogiri'
require 'open-uri'

class ConcertController < ApplicationController
  def search
    @doc = Nokogiri::XML(open("http://feeds.feedburner.com/SchubasCalendar?format=xml"))
  end

   def metro
    @doc = Nokogiri::XML(open("http://metrochicago.com/feed/"))
  end

  def results
    @venue = Venue.find(params[:venue_id])
    @doc = @venue.nokogiri_object
  end

end

