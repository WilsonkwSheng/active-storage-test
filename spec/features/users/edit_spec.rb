# frozen_string_literal: true

require 'rails_helper'

feature 'Edit User' do
  let(:user) { create :user }
  let(:edit_user) { build_stubbed :user }

  before do
    sign_in user
    visit users_path
    click_on 'Edit Profile'
  end

  it 'will update user profile' do
    attach_file(
      'Profile picture',
      File.expand_path('spec/support/images/dup_profile.png')
    )
    fill_in 'Email', with: edit_user.email
    click_on 'Update User'

    user.reload
    expect(user.profile_picture.filename).to eq('dup_profile.png')
    expect(user.email).to eq(edit_user.email)
  end
end
