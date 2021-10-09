# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user_id = current_user.id
    if @comment.save!
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      redirect_to polymorphic_url([@commentable]), notice: t('controllers.common.notice_error', name: Comment.model_name.human)
    end
  end

  def destroy
    Comment.find(params[:id]).destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
