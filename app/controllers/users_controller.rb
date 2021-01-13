# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update]
  before_action :authenticate_user!, only: %i[mypage edit update]
  def index
    @users = User.order(:id).page(params[:page]).per(3)
  end

  def mypage
    redirect_to user_path(current_user)
  end

  def edit
    redirect_to user_path(@users) unless @users == current_user
  end

  def update
    if current_user.update(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user_path(current_user)
    end
  end

  def show; end

  private

  def set_user
    @users = User.find(params[:id])
  end

  def user_params
    params.fetch(:user, {}).permit(:address, :email, :post_code, :self_introduction)
  end
end
