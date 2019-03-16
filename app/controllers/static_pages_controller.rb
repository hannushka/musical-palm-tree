class StaticPagesController < ApplicationController
  def home
    @current_contest = Contest.order("created_at").last
		if @current_contest.end_date.nil?
			@end_date_passed = true
		else
      @end_date_passed = DateTime.now.strftime("%Y-%m-%dT%H:%M") > DateTime.strptime(@current_contest.end_date, "%Y-%m-%dT%H:%M") 
		end
  end
end
