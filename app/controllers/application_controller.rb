class ApplicationController < ActionController::Base
  protect_from_forgery

  def must_haz_user
    redirect_to new_user_session_url unless user_signed_in?
  end
end
