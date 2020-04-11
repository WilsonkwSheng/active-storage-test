# frozen_string_literal: true
require 'rails_helper'

feature 'Register User', type: 'request' do
  let(:user) { build_stubbed :user }

  before :each do
    visit new_user_registration_path
  end

  context 'with valid credentials' do
    it 'successfully create user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      fill_in 'Password confirmation', with: user.password
      click_button 'Sign up'

      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
end
