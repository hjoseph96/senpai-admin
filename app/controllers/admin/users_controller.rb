# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index
    page = strong_params[:page].nil? ? 1 : strong_params[:page]

    @data = ::InternalRestApi.fetch_users(page: page)
  end

  def view_map
  end

  def demographics
  end

  protected

  def strong_params
    params.permit(:page)
  end
end

