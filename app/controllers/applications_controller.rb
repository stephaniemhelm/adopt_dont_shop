class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.create!(application_params)
    #application = Application.create!(application_params, status: "In Progress")
    #application(params[:status]) = "In Progress"
    redirect_to "/applications/#{application.id}"
  end

  def show
    @application = Application.find(params[:id])
    @specific_pets = @application.pets
  end

  private

    def application_params
      params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
    end

end
