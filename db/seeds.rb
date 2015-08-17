# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'
require 'open-uri'

Nokogiri::XML(open("http://feeds.feedburner.com/SchubasCalendar?format=xml"))

venues = [
]

venues.push({:name => 'Schubas', :nokogiri_object => Nokogiri::XML(open("http://feeds.feedburner.com/SchubasCalendar?format=xml"))})
venues.push({:name => 'Metro', :nokogiri_object => Nokogiri::XML(open("http://metrochicago.com/feed/"))})

venues.each do |venue_hash|
  Venue.create(venue_hash)
end
puts "#{Venue.count} services are in the database"


