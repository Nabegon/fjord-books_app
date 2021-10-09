# frozen_string_literal: true

class Users::FollowersController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followers = @user.followers.with_attached_avatar.order(id: :desc).page(params[:page])
  end
end
