# frozen_string_literal: true

require 'rails_helper'

feature 'Users Dashboard' do
  let(:user) { create :user }
  let!(:other_user) { create :user }

  before do
    sign_in user
    visit users_path
  end

  it 'will display list of users' do
    expect(page).to have_content(user.email)
    expect(page).to have_content(other_user.email)
  end
end
