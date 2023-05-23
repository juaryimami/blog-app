require 'rails_helper'

RSpec.describe 'Blog App', type: :feature do
  describe 'login page' do
    before :all do
      user = User.new(
        email: 'admin@gmail.com',
        password: 'password',
        password_confirmation: 'password',
        name: 'Admin',
        role: 'admin'
      )
      user.skip_confirmation!
      user.save!
    end

    it 'new_user_session_path shows the right content' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
      expect(page).to have_content('Log in')
    end

    it 'new_user_session_path show a detailed error' do
      visit new_user_session_path
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'new_user_session_path show a detailed error because wrong information in the form' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'adm@gmail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_content('Invalid Email or password.')
    end

    it 'new_user_session_path redirect to root_path if receive right information' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'Email', with: 'admin@gmail.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(page).to have_current_path(root_path)
    end
  end
end
