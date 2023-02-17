class ChangeColumnsType < ActiveRecord::Migration[7.0]
  def change
    change_table :characters do |t|
      t.index :name
      t.index :url
      t.rename :type, :character_type
    end
    
    change_table :locations do |t|
      t.rename :type, :location_type
    end
  end
end
