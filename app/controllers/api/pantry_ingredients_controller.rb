class Api::PantryIngredientsController < ApplicationController
  before_filter :set_ingredient, only: [:create, :update]
  before_filter :set_pantry_ingredient, only: [:update, :destroy]

  respond_to :json

  def create
    @pantry_ingredient = PantryIngredient.new(pantry_ingredient_params)
    @pantry_ingredient.ingredient = @ingredient

    if @pantry_ingredient.save
      render json: @pantry_ingredient, status: :created
    else
      render status: :unprocessable_entity
    end
  end

  def update
    if @pantry_ingredient.update(ingredient_id: @ingredient.id)
      render json: @pantry_ingredient, status: :ok
    else
      render status: :unprocessable_entity
    end
  end

  def destroy
    @pantry_ingredient.destroy
    render json: @recipe, status: :no_content
  end

  protected

  def pantry_ingredient_params
    params.require(:pantry_ingredient).permit(:pantry_id)
  end

  def set_pantry_ingredient
    @pantry_ingredient = PantryIngredient.find(params[:id])
  end

  def set_ingredient
    @ingredient = Ingredient.find_or_create_by(
    name: params[:pantry_ingredient][:name])
  end
end
