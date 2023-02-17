class Location < ApplicationRecord
  has_many :location_characters, :class_name => 'Character', :foreign_key => 'location_id'
  has_many :origin_characters, :class_name => 'Character', :foreign_key => 'origin_id'
end
