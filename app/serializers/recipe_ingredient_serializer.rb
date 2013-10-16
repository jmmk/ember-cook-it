class RecipeIngredientSerializer < ActiveModel::Serializer
  attributes :id, :recipe_id, :ingredient_id#, :ingredient_name

  # def ingredient_name
  #   object.ingredient.name
  # end
end
