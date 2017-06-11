class ContestsController < ApplicationController
	before_action :require_login

	def require_login
    unless logged_in?
      flash[:danger] = "Du måste logga in för att komma åt denna sidan."
      redirect_to login_path
    end
  end
end
