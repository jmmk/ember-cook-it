class Api::UsersController < ApplicationController
  respond_to :json

  def create
    user = User.new(user_params)
    if user.save
      Pantry.create(user_id: user.id)
      render json: user, status: :created
    else
      render status: 422
    end
  end

  def show
    if session[:user_id]
      render json: current_user
    else
      render nothing: true
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
