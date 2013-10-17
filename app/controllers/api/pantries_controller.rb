class Api::PantriesController < ApplicationController
  respond_to :json

  def show
    @pantry = Pantry.find(params[:id])
    render json: @pantry
  end
end
