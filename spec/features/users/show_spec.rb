# frozen_string_literal: true

require 'rails_helper'

feature 'View User' do
  let(:user) { create :user }

  before do
    sign_in user
    visit users_path
    click_on user.email
  end

  it 'will display user details' do
    expect(page).to have_content(user.email)
    expect(page).to have_link('Click here to download')
    expect(page).to have_link('Click here to preview')
  end
end
