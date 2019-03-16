class BetsController < ApplicationController

	def new
		@bet = Contest.order("created_at").last.bets.build
		@contestants = Contest.order("created_at").last.contestants
		(1..@contestants.all.count).each do |i|
			@bet.placements.build(position: i)
		end
		@current_contest = Contest.order("created_at").last
		@end_date_passed = DateTime.now.strftime("%Y-%m-%dT%H:%M") > DateTime.strptime(@current_contest.end_date, "%Y-%m-%dT%H:%M") 
	end

	def create
		@current_contest = Contest.order("created_at").last
		@bet = @current_contest.bets.new(bet_params)
		if @bet.save 
			flash[:success] = "Din tippning har skickats in."
			redirect_to @bet
			return
		end
		string = ""
		@bet.errors.each do |attribute, msg|
				string = string + " "+ msg
		end
		flash.now[:danger]  = string.to_s
		@contestants = @current_contest.contestants
		render 'new'
	end

	def index
		@contest = Contest.order("created_at").last
		if @contest.completed
			@bets = Bet.select { |b| b.contest_id == @contest.id }.sort_by(&:result)
		else
			@bets = []
		end
		@plac = 1
	end

	def show
		@bet = Bet.find(params[:id])
	end

  def edit
    @bet = Bet.find(params[:id])
		@current_contest = Contest.order("created_at").last
		@contestants = @current_contest.contestants
		if @current_contest.end_date.nil?
			@end_date = ""
		else
			@end_date = @current_contest.end_date
		end
  end

	 def update
		 @bet = Bet.find(params[:id])
		 was_saved = false
		 ActiveRecord::Base.transaction do
			 @bet.placements.update_all(contestant_id: nil)
			 @bet.assign_attributes(bet_params)
			 was_saved = @bet.save
		 end
		 if(was_saved)
			 flash[:success] = "Din tippning har skickats in."
			 redirect_to @bet
			 return
		 else
			 string = ""
			 @bet.errors.each do |attribute, msg|
					string = string + " "+ msg
			 end
			 flash.now[:danger]  = string.to_s
			 @current_contest = Contest.order("created_at").last
			 @contestants = Contest.order("created_at").last.contestants
			 render 'edit'
		 end
	 end

	private
	  def bet_params
	    params.require(:bet).permit(:name, placements_attributes: [:contestant_id, :position, :id])
		end

end
