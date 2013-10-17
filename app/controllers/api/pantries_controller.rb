class Api::PantriesController < ApplicationController
  respond_to :json

  def show
    @pantry = current_user.pantry
    render json: @pantry
  end
end
