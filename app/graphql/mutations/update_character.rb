class Mutations::UpdateCharacter < GraphQL::Schema::Mutation
  argument :id, ID, required: true
  argument :name, String, required: false
  argument :status, String, required: false
  argument :species, String, required: false
  argument :location_id, Integer, required: false
  argument :origin_id, Integer, required: false
  
  field :character, Types::CharacterType, null: true
  field :errors, [String], null: false
  
  def resolve(args)
    character = Character.find(args[:id])
    
    if character.update(args)
      { character: character, errors: [] }
    else
      { character: nil, errors: character.errors.full_messages }
    end
    
  end
  
end
