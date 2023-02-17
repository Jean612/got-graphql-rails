class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :status
      t.string :species
      t.string :type
      t.string :gender
      t.string :image
      t.string :url
      t.references :location
      t.references :origin

      t.timestamps
    end
    
    add_foreign_key :characters, :locations, column: :location_id, primary_key: :id
    add_foreign_key :characters, :locations, column: :origin_id, primary_key: :id
  end
end
