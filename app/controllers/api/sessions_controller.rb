class Api::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: session_params['email'])

    if user && user.valid_password?(session_params['password'])
      sign_in user
      render json: user, status: :created
      return
    else
      render json: {
        errors: {
          email: "invalid email or password"
        }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out :user
    render json: {}, status: :accepted
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
