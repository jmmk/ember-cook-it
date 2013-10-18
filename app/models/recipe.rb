class Recipe < ActiveRecord::Base
  has_many :recipe_ingredients, inverse_of: :recipe, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients

  validates_presence_of :title
  validates_presence_of :directions

  class << self
    def get_top_matches(pantry)
      @pantry_ingredients = PantryIngredient.where(pantry_id: pantry.id)
      @recipe_ingredients = RecipeIngredient.where(
        ingredient_id: @pantry_ingredients.map(&:ingredient_id))
      ids = @recipe_ingredients.map(&:recipe_id).each_with_object(Hash.new(0)){
        |ri,hash| hash[ri] += 1 }.sort_by{ |k,v| v}.map{|k,v| k}.reverse
      Recipe.find(ids).index_by(&:id).slice(*ids).values
    end
  end
end
