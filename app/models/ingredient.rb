class Ingredient < ActiveRecord::Base
  # has_many :recipe_ingredients, inverse_of: :ingredient, dependent: :destroy
  # has_many :recipes, through: :recipe_ingredients

  # has_many :pantry_ingredients, inverse_of: :ingredient, dependent: :destroy
  # has_many :pantries, through: :pantry_ingredients

  belongs_to :element, polymorphic: true

  validates_presence_of :name
end
