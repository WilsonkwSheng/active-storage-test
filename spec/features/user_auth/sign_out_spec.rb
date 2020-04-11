# frozen_string_literal: true

require 'rails_helper'

feature 'User Sign out' do
  let(:user) { create :user }

  it 'signs out successfully' do
    sign_in user
    visit users_path
    click_link 'Sign Out'

    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
end
