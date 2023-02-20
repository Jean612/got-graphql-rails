# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Loading locations"

locations = Rickmorty::Location.new
locations.all.each do |location|
  location = location.deep_symbolize_keys
  Location.create(name: location[:name],
                  location_type: location[:type],
                  dimension: location[:dimension],
                  url: location[:url])
  puts "Location #{location[:name]} created"
end

puts "Loading characters"

characters = Rickmorty::Character.new
characters.all.each do |character|
  character = character.deep_symbolize_keys
  
  location = Location.find_by(url: character[:location][:url])
  origin = Location.find_by(url: character[:origin][:url])
  
  Character.create(
    name: character[:name],
    status: character[:status],
    species: character[:species],
    character_type: character[:type],
    gender: character[:gender],
    image: character[:image],
    url: character[:url],
    location: location || nil,
    origin: origin || nil,
  )
  puts "Character #{character[:name]} created"
end
