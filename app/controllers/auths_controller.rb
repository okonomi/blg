class AuthsController < ApplicationController
  layout false

  before_action :already_logged_in

  def show
  end

  private

    def already_logged_in
      redirect_to root_path if logged_in?
    end
end
