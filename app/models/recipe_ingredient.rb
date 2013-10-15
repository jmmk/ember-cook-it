class RecipeIngredient < ActiveRecord::Base
  belongs_to :ingredient, inverse_of: :recipe_ingredients
  belongs_to :recipe, inverse_of: :recipe_ingredients

  validates_presence_of :ingredient
  validates_presence_of :recipe
end
