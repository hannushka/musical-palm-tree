class ContestsController < ApplicationController
	before_action :require_login

	def new
		@contest = Contest.new
		(1..Setting.first.nbr_contestants).each do |i| # Better solution for determining number of contestants needed
			@contest.contestants.build(start_nbr: i)
		end
	end

	def create
		@contest = Contest.new(contest_params)
	    if @contest.save
					flash[:success] = "Tävlingen har sparats"
	        redirect_to @contest
					return
	    else
				string = ""
				@contest.errors.each do |attribute, msg|
	      	 string = string + " "+ msg
	    	end
				flash.now[:danger]  = string.to_s
	      render 'new'
	    end
	end

	def show
		@contest = Contest.find(params[:id])
	end

	def edit_positions
		@contest = Contest.includes(:contestants).order("contestants.start_nbr asc").find(params[:id])
	end

	def edit
		@contest = Contest.find(params[:id])
		@contestants = @contest.contestants
	end

 	def update
    @contest = Contest.find(params[:id])
    if @contest.update_attributes(contest_params)
      flash[:success] = "Tävlingen har uppdaterats."
      redirect_to bets_path
    else
      render 'edit'
    end
  end

	def require_login
    unless logged_in?
      flash[:danger] = "Du måste logga in för att komma åt denna sidan."
      redirect_to login_path
    end
  end

	private
	  def contest_params
	    params.require(:contest).permit(:name, :completed, :id, contestants_attributes: [:start_nbr, :title, :country, :position, :id])
		end
end
