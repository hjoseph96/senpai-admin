# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index
    page = strong_params[:page].nil? ? 1 : strong_params[:page]

    @data = ::InternalRestApi.fetch_users(page: page)
  end

  def show
    @user = ::InternalRestApi.fetch_user(strong_params[:id].to_i)
  end

  def view_map
  end

  def demographics
    @user_data = ::InternalRestApi.fetch_all_users

    @gender_data = merge_data_counts(@user_data.group_by(&:gender))
    @orientation_data = merge_data_counts(@user_data.group_by(&:orientation))
    @age_data = merge_data_counts(@user_data.group_by(&:age))
  end

  def ban_user
    response = ::InternalRestApi.ban_user(strong_params[:id])
    redirect_to user_show_path(response.id)
  end

  def warn_user
    response = ::InternalRestApi.warn_user(strong_params[:id])
    redirect_to user_show_path(response.id)
  end

  protected

  def strong_params
    params.permit(:page, :id)
  end

  def merge_data_counts(data)
    data.map {|k, v| { k => v.count } }.reduce Hash.new, :merge
  end
end

