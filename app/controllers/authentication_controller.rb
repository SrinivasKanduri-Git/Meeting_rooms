# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def jwt_login
    user = User.find_by(user_name: params[:user_name])
    if user&.authenticate(params[:password])
      token = generate_jwt_token(user)
      render json: { user:, token: }
    else
      render json: { errors: 'Invalid user name or password' }, status: :unprocessable_entity
    end
  end
end
