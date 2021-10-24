class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
  end

  def new
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:alert] = "Missing fields must be completed."
      render :new
    end
  end

  def show
    @application = Application.find(params[:id])
    @specific_pets = @application.pets
  end

  private

    def application_params
      if params[:status] == nil
        params[:status] = 'In Progress'
      end

      params.permit(:name, :street_address, :city, :state, :zip_code, :description, :status)
    end

end
