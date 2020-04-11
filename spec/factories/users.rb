# frozen_string_literal: true
FactoryBot.define do
  profile_picture_attachment = Rack::Test::UploadedFile.new(
    Rails.root.join('spec', 'support', 'images', 'default_profile.png')
  )

  factory :user do
    sequence :email do |n|
      "user-#{n}-#{Time.now.to_i.to_s(32)}@example.com"
    end
    password { 'password' }
    profile_picture { profile_picture_attachment }
  end
end
