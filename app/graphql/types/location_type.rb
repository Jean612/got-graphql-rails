# frozen_string_literal: true

module Types
  class LocationType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :location_type, String
    field :dimension, String
    field :url, String
    field :location_characters, [Types::CharacterType]    
    field :origin_characters, [Types::CharacterType]
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
