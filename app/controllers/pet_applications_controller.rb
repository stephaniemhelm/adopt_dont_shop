class PetApplicationsController < ApplicationController
  def index
  end

  def create
    application = Application.find(params[:id])
    PetApplication.create!(application: application, pet: Pet.where(name: params[:name]).first)
    redirect_to "/applications/#{params[:application]}"
  end

end
