module ApplicationHelper

	def fix_url(str)
		str.start_with?("http://") ? str : "http://#{str}"
	end

	def format_time(time)
		time.strftime("on %A %b-%e-%Y at %l:%M%P")
	end
end
