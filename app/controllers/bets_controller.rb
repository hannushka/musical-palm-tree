class BetsController < ApplicationController

	def new
		@bet = Contest.order("created_at").last.bets.build
		(1..Contestant.all.count).each do |i|
			@bet.placements.build(position: i)
		end
	end

	def create
		@bet = Contest.order("created_at").last.bets.new(bet_params)
    if @bet.save
				flash[:success] = "Din tippning har skickats in."
        redirect_to @bet
    else
			string = ""
			@bet.errors.each do |attribute, msg|
      	 string = string + " "+ msg
    	end
			flash[:danger] = string.to_s
      render 'new'
    end
	end

	def show
		@bet = Bet.find(params[:id])
	end

	private
	  def bet_params
	    params.require(:bet).permit(:name, placements_attributes: [:position, :contestant_id])
end

end
