class AddIndexesLocation < ActiveRecord::Migration[7.0]
  def change
    add_index :locations, :name
    add_index :locations, :url
  end
end
