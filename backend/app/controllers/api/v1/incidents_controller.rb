class Api::V1::IncidentsController < ApplicationController
  protect_from_forgery with: :null_session

  before_action :authorize_request, except: %i(index)

  def create
    @incident = Incident.new(incident_params)
    @incident.user = @current_user

    if @incident.save
      render json: @incident
    else
      render json: @incident.errors, status: :unprocessable_entity
    end
  end

  def show
    @incident = Incident.find(params[:id])
    render json: @incident
  end

  def index
    @incidents = Incident.all
    render json: @incidents
  end

  private

    def incident_params
      params.require(:incident).permit(
        :longitude, :latitude, :age, :gender, :status, :confirmed, :address, :description,
        :archived
      )
    end
end
