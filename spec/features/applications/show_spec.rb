require 'rails_helper'

RSpec.describe 'Applications Show Page' do

  it 'can show application attributes' do
    application1 = FactoryBot.create(:application)
    application2 = FactoryBot.create(:application)

    visit '/applications'

    #visit "/applications/#{application1.id}"
    #
    # expect(page).to have_content(application1.name)
    # expect(page).to have_content(application1.street_address)
    # expect(page).to have_content(application1.city)
    # expect(page).to have_content(application1.state)
    # expect(page).to have_content(application1.zip_code)
    # expect(page).to have_content(application1.description)


  end

end
