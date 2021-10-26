class ApplicationsController < ApplicationController

  def index
    @applications = Application.all
    #@pet = Pet.find(params[:id])
  end

  def new
    #@favorite_pet = Pet.find(params[:id])
  end

  def create
    application = Application.new(application_params)
    if application.save
      redirect_to "/applications/#{application.id}"
    else
      flash[:notice] = "Missing fields must be completed."
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
