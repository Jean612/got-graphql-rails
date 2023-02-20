# frozen_string_literal: true

module Types
  class CharacterType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :status, String, null: true
    field :species, String, null: true
    field :character_type, String, null: true
    field :gender, String, null: true
    field :image, String, null: true
    field :url, String, null: true
    field :location_id, Integer, null: true
    field :origin_id, Integer, null: true
    field :location, Types::LocationType, null: true
    field :origin, Types::LocationType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
