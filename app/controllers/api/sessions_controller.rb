class Api::SessionsController < ApplicationController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: session_params['email'])
    session[:user_id] = user.id
    if user && user.valid_password?(session_params['password'])
      sign_in :user, user
      render json: { session: { id: user.id, email: user.email } }, status: :created
    else
      render json: {
        errors: {
          email: "invalid email or password"
        }
      }, status: :unprocessable_entity
    end
  end

  def destroy
    reset_session
    render json: {}, status: :accepted
  end

  def show
    if session[:user_id]
      render json: { session: { id: current_user.id, email: current_user.email} }
    else
      render nothing: true
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
