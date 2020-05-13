class Api::V1::SessionsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :find_user, only: %i(create)

  def create
    if @user&.authenticate(params[:password])
      render json: session_payload, status: :ok
    else
      render json: { error: 'You are not logged in.' }, status: :unauthorized
    end
  rescue ActiveRecord::RecordNotFound
    render json: { errors: "User not found" }, status: :not_found
  end

  private

    def session_params
      params.permit(:identifier, :password)
    end

    def find_user
      u = User.arel_table
      conditions = u[:email].eq(params[:identifier]).or(
          u[:username].eq(params[:identifier])
        )

      @user = User.where(conditions).first!
    end

    def session_payload
      expiration_time = 24.hour.from_now

      {
        token: JsonWebToken.encode({ user_id: @user_id }, expiration_time),
        expiration_time: expiration_time.strftime("%d-%m-%Y %H:%M"),
        username: @user.username
      }
    end
end
