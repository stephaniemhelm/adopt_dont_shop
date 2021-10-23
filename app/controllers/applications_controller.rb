class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def new
    application = Application.create!(application_params)
    redirect_to "/applications/#{application.id}"
  end

  def show
    @application = Application.find(params[:id])
    @specific_pets = @application.pets 
  end

  private

    def application_params
      params.permit(:name, :street_address, :city, :state, :zip_code, :description)
    end

end
