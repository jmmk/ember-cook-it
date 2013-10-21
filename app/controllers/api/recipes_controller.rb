class Api::RecipesController < ApplicationController
  before_filter :set_recipe, only: [:show, :destroy, :update]
  respond_to :json

  def index
    if params[:pantry] == 'current'
      @recipes = Recipe.get_top_matches(current_user.pantry)
    elsif params[:pantry] == 'example'
      @recipes = Recipe.get_top_matches(Pantry.find(1))
    elsif params[:type] == 'recent'
      @recipes =  Recipe.order('created_at DESC').limit(5)
    else
      @recipes = Recipe.all
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
