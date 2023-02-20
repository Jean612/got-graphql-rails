class Mutations::DestroyCharacter < GraphQL::Schema::Mutation
  argument :id, ID, required: true
  
  field :message, String, null: false
  field :errors, [String], null: false
  
  def resolve(id:)
    character = Character.find(id)
    
    if character.destroy
      { message: "El personaje fue eliminado", errors: [] }
    else
      raise GraphQL::ExecutionError, character.errors.full_messages.join(", ")
    end
    
  end
  
end
