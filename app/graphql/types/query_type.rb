module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :characters, [CharacterType], null: false, description: "List all characters"
    def characters
      Character.all
    end
    
    field :character_count, Integer, null: false
    def character_count
      Character.count
    end
    
    field :character_by_name, CharacterType, "Find Character by name" do
      argument :name, String
    end
    def character_by_name(name:)
      Character.find_by_name(name)
    end
    
    field :character, CharacterType, "Find Character by ID" do
      argument :id, ID
    end
    def character(id:)
      Character.find(id)
    end
    
    field :locations, [LocationType], null: false, description: "List all locations"
    def locations
      Location.all
    end
    
  end
end
