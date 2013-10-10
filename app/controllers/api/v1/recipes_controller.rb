class Api::V1::RecipesController < ApplicationController
  respond_to :json

  def index
    render json: Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    render json: @recipe, include: []
  end

  protected

  def recipe_params
    params.require(:recipe).permit(:title, :directions)
  end
end
