class Character < ApplicationRecord
  belongs_to :location, :class_name => 'Location', optional: true
  belongs_to :origin, :class_name => 'Location', optional: true
  
  validates :name, presence: true, length: { minimum: 5 }
  validates_uniqueness_of :name, on: [:create, :update], message: "El nombre del personaje ya existe"
end
