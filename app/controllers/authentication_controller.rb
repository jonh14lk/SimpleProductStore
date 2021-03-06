class AuthenticationController < ApplicationController
  # login nao precisa de autenciacao
  skip_before_action :authenticate_user, only: [:login]

  def login
    user = User.find_by(email: user_params[:email])

    if user&.authenticate(user_params[:password])
      auth_token = JsonWebToken.encode( { id: user.id, email: user.email } )
      
      render json: { user: user, token: auth_token }
    else
      render json: { error: 'Invalid email or password' }, status: :not_found
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
