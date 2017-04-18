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
					return
	    else
				string = ""
				@bet.errors.each do |attribute, msg|
	      	 string = string + " "+ msg
	    	end
				flash.now[:danger]  = string.to_s
	      render 'new'
	    end
	end

	def show
		@bet = Bet.find(params[:id])
	end

  def edit
    @bet = Bet.find(params[:id])
  end

	 def update
	 @bet = Bet.find(params[:id])
    if @bet.update_attributes(bet_params)
				flash[:success] = "Din tippning har skickats in."
				redirect_to @bet
				return
    else
			string = ""
			@bet.errors.each do |attribute, msg|
      	 string = string + " "+ msg
    	end
			flash.now[:danger]  = string.to_s
      render 'edit'
    end
  end

	private
	  def bet_params
	    params.require(:bet).permit(:name, placements_attributes: [:contestant_id, :position, :id])
end

end
