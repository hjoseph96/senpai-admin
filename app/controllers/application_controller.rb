class ApplicationController < ActionController::Base

  def after_sign_in_path_for user
    user_list_path
  end

  def after_sign_out_path_for user
    root_path
  end

  def authenticate_user!
    redirect_to root_path unless user_signed_in?
  end
end
