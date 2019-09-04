require "./spec/spec_helper.rb"

feature 'battle_spec tests' do
  feature 'Enter names' do
    scenario 'submitting names' do
      sign_in_and_play
      expect(page).to have_content 'Bob vs Marley!!'
    end
  end

  feature 'hit points' do
    scenario 'player 1 can see player 2 hit points' do
      sign_in_and_play
      expect(page).to have_content 'Marley has 0 hit points'
    end
  end

  feature 'attacking' do
    scenario 'player 1 attacks player 2 and gets a confirmation' do
      sign_in_and_play
      click_button 'Attack Player 2'
      expect(page).to have_content 'Marley has been attacked'
    end
  end

end