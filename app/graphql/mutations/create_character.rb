class Mutations::CreateCharacter < GraphQL::Schema::Mutation
  argument :name, String, required: true
  argument :status, String, required: false
  argument :species, String, required: false
  argument :location_id, Integer, required: false
  argument :origin_id, Integer, required: false
  
  field :character, Types::CharacterType, null: true
  field :errors, [String], null: false
  
  def resolve(args)
    character = Character.new(args)
    
    if character.save
      { character: character, errors: [] }
    else
      { character: nil, errors: character.errors.full_messages }
    end
    
  end
  
end
