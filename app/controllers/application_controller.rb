class ApplicationController < ActionController::Base
  include Pundit

  def current_user
    User.new
  end
end
