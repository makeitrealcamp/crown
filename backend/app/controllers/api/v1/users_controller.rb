class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authorize_request, except: %i(create)
  before_action :find_user, only: %i(show)

  def create
    @user = User.new(user_params)

    if @user.save
      response = { user: @user, token: JsonWebToken.encode(user_id: @user.id) }
      render json: response, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def profile    
    render json: @current_user, status: :ok
  end

  private

    def user_params
      params.permit(:name, :last_name, :email, :username, :password, :password_confirmation)
    end
end
