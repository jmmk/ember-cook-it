class Api::IngredientsController < ApplicationController
  before_filter :set_ingredient, only: [:update, :destroy]
  respond_to :json

  def create
    @ingredient = Ingredient.new(ingredient_params)

    if @ingredient.save
      render json: @ingredient, status: :created
    else
      render status: 422
    end
  end

  def update
    if @ingredient.update(ingredient_params)
      render json: @ingredient, status: :ok
    else
      render status: 422
    end
  end

  def destroy
    @ingredient.destroy
    render json: @ingredient, status: 204
  end

  protected

  def ingredient_params
    params.require(:ingredient).permit(:name, :element_id, :element_type)
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
