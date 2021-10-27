class PetApplicationsController < ApplicationController
  def index
  end

  def create
    application = Application.find(params[:application_id])
    PetApplication.create!(application: application, pet: Pet.find(params[:pet_id]))
    redirect_to "/applications/#{params[:application]}"
  end

end
