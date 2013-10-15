class AddElementToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :element_id, :integer
    add_column :ingredients, :element_type, :string
  end
end
