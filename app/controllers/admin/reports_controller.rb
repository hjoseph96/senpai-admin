# frozen_string_literal: true
class Admin::ReportsController < ApplicationController
  def index
    page = strong_params[:page].nil? ? 1 : strong_params[:page]

    @data = InternalRestApi.fetch_all_reports(page: page)
  end

  def show
    @report = InternalRestApi.fetch_report(params['id'])
  end

  def resolve
    @report = InternalRestApi.resolve_report(params['id'])
    redirect_to reports_path
  end

  protected

  def strong_params
    params.permit(:page, :id)
  end
end

