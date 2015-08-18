# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'nokogiri'
require 'open-uri'


Venue.destroy_all
venues = [
]
venues.push({:name => 'Schubas', :url => "http://feeds.feedburner.com/SchubasCalendar?format=xml"})
venues.push({:name => 'Metro', :url => "http://metrochicago.com/feed/"})

venues.each do |venue_hash|
  nokogiri_object = Nokogiri::XML(open("#{venue_hash[:url]}"))

  nokogiri_object.css('item').each do |item|
    v=Venue.new
    v.name = venue_hash[:name]
    v.date = item.css('pubDate').text
    v.show = item.css('title').text
    v.save
  end
end
puts "#{Venue.count} venues are in the database"







