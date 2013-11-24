module ApplicationHelper

	def fix_url(str)
		str.start_with?("http://") ? str : "http://#{str}"
	end

	def format_time(time)
		time.strftime("on %A %b-%e-%Y at %l:%M%P")
	end

  def vote_count(voteable)
      voteable.votes.where(vote: true).count - voteable.votes.where(vote: false).count
  end 
end
