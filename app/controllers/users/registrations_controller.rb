# frozen_string_literal: true

module Users
  class RegistrationsController < Devise::RegistrationsController
    def new
      super
    end

    private

    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation, :profile_picture)
    end
  end
end
