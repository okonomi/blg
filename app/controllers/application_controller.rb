class ApplicationController < ActionController::Base
  include Pundit

  helper_method :logged_in?

  private

  def current_user
    User.find_by(remember_token: session[:remember_token])
  end

  def logged_in?
    current_user.present?
  end
end
