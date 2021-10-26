class PetApplicationsController < ApplicationController
  def index
    @applicatons = @application.find_by(params[:id])
    #@pets = @pet.find_by(params[:id])
    @favorite_pets = @application.pets 
  end


end
