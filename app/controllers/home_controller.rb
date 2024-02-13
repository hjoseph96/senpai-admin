class HomeController < ApplicationController
  def index
    return redirect_to(user_list_path) if user_signed_in?
  end

  def user_list_all
  end
end
