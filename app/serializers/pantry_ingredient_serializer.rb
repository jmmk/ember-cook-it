class PantryIngredientSerializer < ActiveModel::Serializer
  attributes :id, :pantry_id, :ingredient_id
end
