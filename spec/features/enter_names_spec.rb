require "./spec/spec_helper.rb"

  feature 'Enter names' do
    scenario 'submitting names' do
      visit('/')
      fill_in :player_1, with: 'Bob'
      fill_in :player_2, with: 'Marley'
      click_button 'Submit'
      expect(page).to have_content 'Bob vs Marley!!'
    end
  end