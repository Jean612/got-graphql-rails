class Character < ApplicationRecord
  belongs_to :location, :class_name => 'Location'
  belongs_to :origin, :class_name => 'Location'
end
