# frozen_string_literal: true
require 'rails_helper'

feature 'Sign In User', type: 'request' do
  let(:user) { create :user }

  before :each do
    visit new_user_session_path
  end

  context 'with valid credentials' do
    it 'successfully login user' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content('Signed in successfully.')
    end
  end
end
