class PantryIngredientSerializer < ActiveModel::Serializer
  attributes :id, :pantry_id, :ingredient_id, :name

  def name
    object.ingredient.name
  end
end
