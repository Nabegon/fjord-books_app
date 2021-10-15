# frozen_string_literal: true

class ReportsController < ApplicationController
  before_action :set_report, only: %i[show edit update destroy]

  def index
    @reports = Report.order(:id).page(params[:page])
  end

  def show; end

  def new
    @report = Report.new
  end

  def edit
    @report = Report.find(params[:id])
    redirect_to new_report_path unless @report.user_id == current_user.id
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.save!
    redirect_to @report, notice: t('controllers.common.notice_create', name: Report.model_name.human)
  end

  def update
    @report = Report.find(params[:id])
    redirect_to new_report_path unless @report.user_id == current_user.id
    @report.update(report_params)
    redirect_to @report, notice: t('controllers.common.notice_update', name: Report.model_name.human)
  end

  def destroy
    redirect_to new_report_path unless @report.user_id == current_user.id
    @report.destroy
    redirect_to @report, notice: t('controllers.common.notice_destroy', name: Report.model_name.human)
  end
  # reports_url
  private

  def set_report
    @report = Report.find(params[:id])
  end

  def report_params
    params.require(:report).permit(:title, :content)
  end
end
