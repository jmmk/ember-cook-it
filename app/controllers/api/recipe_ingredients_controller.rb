class Api::RecipeIngredientsController < ApplicationController
  before_filter :set_ingredient, only: [:update, :destroy]
  respond_to :json

  def create
    @ingredient = Ingredient.find_or_create_by(
      name: params[:recipe_ingredient][:name])
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.ingredient = @ingredient

    if @recipe_ingredient.save
      render json: @recipe_ingredient, status: :created
    else
      render status: 422
    end
  end

  protected

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id, :name)
  end
end
