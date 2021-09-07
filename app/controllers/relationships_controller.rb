# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    redirect_to user, notice: 'フォローに成功しました'
  end

  def destroy
    user = current_user.active_relationships.find(params[:id]).followed
    current_user.unfollow(user)
    redirect_to user, notice: 'アンフォローしました'
  end
end
