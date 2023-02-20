module Types
  class MutationType < Types::BaseObject
    
    field :create_character, mutation: Mutations::CreateCharacter
    field :update_character, mutation: Mutations::UpdateCharacter
    field :destroy_character, mutation: Mutations::DestroyCharacter
       
    field :add_character, CharacterType, null: false, description: "Add a character" do
      argument :name, String
      argument :status, String, required: false
      argument :species, String, required: false
      argument :location_id, Integer, required: false
      argument :origin_id, Integer, required: false
    end
    def add_character(args)
      Character.create(args)
    end
    
    field :delete_character, [CharacterType], null: false, description: "remove character" do
      argument :id, ID, required: true
    end
    def delete_character(id:)
      Character.destroy(id)
      Character.all
    end
    
    field :edit_character, CharacterType, null:false, description: "edit character" do
      argument :id, ID, required: true
      argument :status, String, required: false
      argument :species, String, required: false
      argument :name, String, required: false
      argument :character_type, String, required: false
      argument :gender, String, required: false
      argument :location_id, Integer, required: false
      argument :origin_id, Integer, required: false
    end
    def edit_character(args)
      character = Character.find(args[:id])
      character.update(args.except(:id))
      character
    end
  end
end
