class BetsController < ApplicationController

	def new
		@bet = Bet.new
	end

	def create
		@bet = Bet.new(bet_params)
    if @bet.save
        redirect_to root_path, alert: "bet created successfully."
    else
        redirect_to new_bet_path, alert: "Error creating bet."
    end
	end

	private
	  def bet_params
	    params.require(:bet).permit(:name)
end

end
