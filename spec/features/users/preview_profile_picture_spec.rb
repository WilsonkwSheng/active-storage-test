# frozen_string_literal: true

require 'rails_helper'

feature 'Preview User Profile Picture' do
  let(:user) { create :user }

  before do
    sign_in user
    visit users_path
    click_on user.email
    click_on 'Click here to preview'
  end

  it 'will successfully preview profile picture' do
    expect(page.response_headers['Content-Disposition']).to have_content('default_profile.png')
  end
end
