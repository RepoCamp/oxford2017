# Generated via
#  `rails generate hyrax:work Etd`
require 'rails_helper'
include Warden::Test::Helpers

# NOTE: If you generated more than one work, you have to set "js: true"
RSpec.feature 'Create a Etd', js: false do
  context 'a logged in user' do
    let(:user_attributes) do
      { email: 'test@example.com' }
    end
    let(:user) do
      User.new(user_attributes) { |u| u.save(validate: false) }
    end

    before do
      AdminSet.find_or_create_default_admin_set_id
      login_as user
    end

    scenario do
      visit '/dashboard'
      click_link "Works"
      click_link "Add new work"

      # If you generate more than one work uncomment these lines
      # choose "payload_concern", option: "Etd"
      # click_button "Create work"

      expect(page).to have_content "Add New Etd"
      visit '/concern/etds/new'
      fill_in 'Title', with: 'Journey to Skull Island'
      fill_in 'Creator', with: 'Quest, Jane'
      fill_in 'Keyword', with: 'Adventure'
      select('In Copyright', from: 'Rights statement')
      choose('open')
      check('agreement')
      click_on('Files')
      attach_file('files[]', "#{fixture_path}/fake_text1.pdf")
      click_on('Save')
      expect(page).to have_content 'Your files are being processed'
      expect(page).to have_content 'Journey to Skull Island'
      expect(page).to have_content 'Quest, Jane'
      expect(page).to have_content 'Adventure'
    end
  end
end
