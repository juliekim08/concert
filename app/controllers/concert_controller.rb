require 'nokogiri'
require 'open-uri'

class ConcertController < ApplicationController
  def search
    @doc = Nokogiri::XML(open("http://feeds.feedburner.com/SchubasCalendar?format=xml"))
  end

   def metro
    @doc = Nokogiri::XML(open("http://metrochicago.com/feed/"))
  end

end

