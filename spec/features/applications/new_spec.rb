# Starting an Application
#
# As a visitor
# When I visit the pet index page
# Then I see a link to "Start an Application"
# When I click this link
# Then I am taken to the new application page where I see a form
# When I fill in this form with my:
#   - Name
#   - Street Address
#   - City
#   - State
#   - Zip Code
# And I click submit
# Then I am taken to the new application's show page
# And I see my Name, address information, and description of why I would make a good home
# And I see an indicator that this application is "In Progress"
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

end
