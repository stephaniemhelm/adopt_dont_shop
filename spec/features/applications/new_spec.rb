
require 'rails_helper'

RSpec.describe 'Start an Application' do
  it 'links to new page from pet index' do
    visit '/pets'

    click_link('Start an Application')
    expect(current_path).to eq('/applications/new')
  end

  it 'can create a new application'  do
    visit '/applications/new'
    fill_in('Name', with: "Sally Jordan")
    fill_in('Street address', with: "4 Oak Street")
    fill_in('City', with: "Salida")
    fill_in('State', with: "AZ")
    fill_in('Zip code', with: 75418)
    fill_in('Description', with: "I love cats!")

    click_on('Submit Application')

    new_application_id = Application.last.id
    expect(current_path).to eq("/applications/#{new_application_id}")
    expect(page).to have_content("Sally Jordan")
    expect(page).to have_content("4 Oak Street")
    expect(page).to have_content("Salida")
    expect(page).to have_content("AZ")
    expect(page).to have_content(75418)
    expect(page).to have_content("I love cats")
  end


  it 'will not create an application with missing information' do
    visit '/applications/new'

    click_on('Submit Application')
    expect(page).to have_content("Missing fields must be completed.")
    expect(page).to have_button('Submit Application')
  end

end
