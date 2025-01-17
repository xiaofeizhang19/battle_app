require "./spec/spec_helper.rb"

feature 'battle_spec tests' do
  feature 'Enter names' do
    scenario 'submitting names' do
      sign_in_and_play
      expect(page).to have_content 'Bob vs Marley!!'
    end
  end

  feature 'view hit points' do
    scenario 'player 1 can see their own own hit points' do
      sign_in_and_play
      expect(page).to have_content 'Bob has 60 hit points'
    end

    scenario 'player 1 can see player 2 hit points' do
      sign_in_and_play
      expect(page).to have_content 'Marley has 60 hit points'
    end
  end

  feature 'attacking' do
    scenario 'player 1 attacks player 2 and gets a confirmation' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Marley has been attacked'
    end

    scenario 'player 1 reduces player 2\'s hit points by 10' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).to have_content 'Marley: 50 HP'
    end
  end
  
  feature 'switching turns' do
    scenario 'seeing the current turn at begining of game' do
      sign_in_and_play
      expect(page).to have_content 'It\'s Bob\'s turn'
    end
  end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button 'Attack'
      expect(page).not_to have_content 'It\' Bob\'s turn'
      expect(page).to have_content 'It\'s Marley\'s turn next'
    end

    scenario 'after player 2 attacks' do
      sign_in_and_play
      attack_and_confirm
      click_button 'Attack'
      expect(page).not_to have_content 'It\'s Marley\'s turn'
      expect(page).to have_content 'It\'s Bob\'s turn'
    end

    feature 'game over' do
      scenario 'when one player reaches 0 hit point' do
        sign_in_and_play
        10.times { attack_and_confirm }   
        click_button 'Attack'
        expect(page).to have_content 'Marley loses'
      end
    end
end
