
require 'rails_helper'

RSpec.describe 'Start an Application' do
  it 'links to new page from pet index' do
    visit '/pets'

    click_link('Start an Application')
    expect(current_path).to eq('/applications/new')
  end

  it 'can create a new application'  do
    visit '/applications'
    fill_in('Name', with: "Sally Jordan")
    fill_in('Street Address', with: "4 Oak Street")
    fill_in('City', with: "Salida")
    fill_in('State', with: "AZ")
    fill_in('Zip Code', with: 75418)
    fill_in('Description', with: "I love cats!")

    click_on('Submit Application')

    new_application_id = Application.last.id
    expect(current_path).to eq("/applicatons/#{new_application_id}")
    expect(page).to have_content("Sally Jordan")
  end

  # As a visitor
  # When I visit the new application page
  # And I fail to fill in any of the form fields
  # And I click submit
  # Then I am taken back to the new applications page
  # And I see a message that I must fill in those fields.

  it 'will not create an application with missing information' do
    visit '/applications/new'

    click_on('Submit Application')
    expect(page).to have_content("Missing fields must be completed.")
    expect(page).to have_button('Submit Application')
  end

end
