class Api::RecipeIngredientsController < ApplicationController
  before_filter :set_ingredient, only: [:create, :update]
  before_filter :set_recipe_ingredient, only: [:update, :destroy]

  respond_to :json

  def create
    @recipe_ingredient = RecipeIngredient.new(recipe_ingredient_params)
    @recipe_ingredient.ingredient = @ingredient

    if @recipe_ingredient.save
      render json: @recipe_ingredient, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def update
    if @recipe_ingredient.update(ingredient_id: @ingredient.id)
      render json: @recipe_ingredient, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_ingredient.destroy
    render json: @recipe, status: :no_content
  end

  protected

  def recipe_ingredient_params
    params.require(:recipe_ingredient).permit(:recipe_id)
  end

  def set_recipe_ingredient
    @recipe_ingredient = RecipeIngredient.find(params[:id])
  end

  def set_ingredient
    @ingredient = Ingredient.find_or_create_by(
      name: params[:recipe_ingredient][:name])
  end
end
