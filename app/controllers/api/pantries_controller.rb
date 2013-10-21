class Api::PantriesController < ApplicationController
  respond_to :json

  def show
    if params[:id] == 'example'
      @pantry = Pantry.find(1)
    else
      @pantry = current_user.pantry
    end

    render json: @pantry
  end
end
