# frozen_string_literal: true

class Admin::VerifyRequestsController < ApplicationController
  def index
    page = strong_params[:page].nil? ? 1 : strong_params[:page]

    @data = InternalRestApi.fetch_verify_requests(page: page)
  end

  def show
    @request = InternalRestApi.fetch_verify_request(strong_params['id'])
  end

  def approve
    @request = InternalRestApi.approve(strong_params['id'])
    redirect_to verify_requests_path
  end

  def deny
    @request = InternalRestApi.deny(strong_params['id'])
    redirect_to verify_requests_path
  end

  protected

  def strong_params
    params.permit(:page, :id, :request_id)
  end
end

