# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def create
    user = User.find(params[:followed_id])
    current_user.follow(user)
    flash[:notice] = 'フォローに成功しました'
    redirect_to user
  end

  def destroy
    user = current_user.active_relationships.find(params[:id]).followed
    current_user.unfollow(user)
    flash[:notice] = 'アンフォローしました'
    redirect_to user
  end
end
