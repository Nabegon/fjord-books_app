# frozen_string_literal: true

class Users::FollowingsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @followings = @user.followings.with_attached_avatar.order(id: :desc).page(params[:page])
  end
end
