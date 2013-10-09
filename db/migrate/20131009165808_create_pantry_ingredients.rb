class CreatePantryIngredients < ActiveRecord::Migration
  def change
    create_table :pantry_ingredients do |t|
      t.integer :pantry_id, null: false
      t.integer :ingredient_id, null: false

      t.timestamps
    end
  end
end
