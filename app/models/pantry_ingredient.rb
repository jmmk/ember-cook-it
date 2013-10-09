class PantryIngredient < ActiveRecord::Base
  belongs_to :ingredient, inverse_of: :pantry_ingredients
  belongs_to :pantry, inverse_of: :pantry_ingredients

  validates_presence_of :pantry
  validates_presence_of :ingredient
end
