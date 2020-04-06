# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.order(created_at: 'desc')
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.profile_picture.purge if params[:user][:remove_profile] == '1'
    if @user.update(user_params)
      flash[:success] = 'Success'
      redirect_to user_path(@user)
    else
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:email, :profile_picture)
  end
end
