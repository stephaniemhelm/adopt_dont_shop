require 'rails_helper'

RSpec.describe 'Applications Show Page' do

  it 'can show application attributes' do
      shelter1 = FactoryBot.create(:shelter)
      shelter2 = FactoryBot.create(:shelter)

      pet1 = FactoryBot.create(:pet, shelter_id: shelter1.id)
      pet2 = FactoryBot.create(:pet, shelter_id: shelter1.id)
      pet3 = FactoryBot.create(:pet, shelter_id: shelter2.id)
      pet4 = FactoryBot.create(:pet, shelter_id: shelter2.id)

      application1 = FactoryBot.create(:application)
      application2 = FactoryBot.create(:application)
      application3 = FactoryBot.create(:application)

      pet_application1 = PetApplication.create(pet_id: pet1.id, application_id: application1.id)
      pet_application2 = PetApplication.create(pet_id: pet2.id, application_id: application1.id)
      pet_application3 = PetApplication.create(pet_id: pet3.id, application_id: application2.id)
      pet_application4 = PetApplication.create(pet_id: pet1.id, application_id: application3.id)

    visit '/applications'
    visit "/applications/#{application1.id}"

    expect(page).to have_content(application1.name)
    expect(page).to have_content(application1.street_address)
    expect(page).to have_content(application1.city)
    expect(page).to have_content(application1.state)
    expect(page).to have_content(application1.zip_code)
    expect(page).to have_content(application1.description)

    expect(page).to_not have_content(application2.name)
    expect(page).to_not have_content(application2.street_address)

  end

  it 'can find all pets for an application' do
    shelter1 = FactoryBot.create(:shelter)
    shelter2 = FactoryBot.create(:shelter)

    pet1 = FactoryBot.create(:pet, shelter_id: shelter1.id)
    pet2 = FactoryBot.create(:pet, shelter_id: shelter1.id)
    pet3 = FactoryBot.create(:pet, shelter_id: shelter2.id)
    pet4 = FactoryBot.create(:pet, shelter_id: shelter2.id)

    application1 = FactoryBot.create(:application)
    application2 = FactoryBot.create(:application)
    application3 = FactoryBot.create(:application)

    pet_application1 = PetApplication.create(pet_id: pet1.id, application_id: application1.id)
    pet_application2 = PetApplication.create(pet_id: pet2.id, application_id: application1.id)
    pet_application3 = PetApplication.create(pet_id: pet3.id, application_id: application2.id)
    pet_application4 = PetApplication.create(pet_id: pet1.id, application_id: application3.id)

    visit '/applications'
    visit "/applications/#{application1.id}"

    expect(application1.pets).to eq([pet1, pet2])
  end
end
