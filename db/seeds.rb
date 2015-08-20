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
venues.push({:name => 'Empty Bottle', :url => "http://emptybottle.com/full/"})

venues.each do |venue_hash|
Venue.create(venue_hash)
end
puts "#{Venue.count} venues are in the database"

Event.destroy_all
Venue.all.each do |venue|
  nokogiri_object = Nokogiri::XML(open("#{venue.url}"))
  nokogiri_object.css('item').each do |item|
    e=Event.new
    e.name = venue.name
    e.venue_id = venue.id
    e.date = item.css('pubDate').text.to_datetime
    e.show = item.css('title').text
    e.save
  end
end
puts "#{Event.count} events are in the database"







