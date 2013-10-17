class Api::RecipesController < ApplicationController
  before_filter :set_recipe, only: [:show, :destroy, :update]
  respond_to :json

  def index
    if params[:pantry]
      @pantry_ingredients = PantryIngredient.where(pantry_id: current_user.pantry.id)
      @recipe_ingredients = RecipeIngredient.where(
        ingredient_id: @pantry_ingredients.map(&:ingredient_id))
      @recipes = Recipe.where(id: @recipe_ingredients.map(&:recipe_id))
    else
      @recipes =  Recipe.order('created_at DESC').limit(5)
    end
    render json: @recipes
  end

  def show
    render json: @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
    render json: @recipe, status: :no_content
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  protected

  def recipe_params
    params.require(:recipe).permit(:title, :directions)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

end
