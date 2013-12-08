module ApplicationHelper

	def fix_url(str)
		str.start_with?("http://", "https://") ? str : "http://#{str}"
	end

	def format_time(time)
		time.strftime("on %A %b %e, %Y at %l:%M%P %Z")
	end

  def time_zone(time)
    if logged_in?
      format_time(time.in_time_zone(current_user.timezone))
    else
      format_time(time.in_time_zone('Pacific Time (US & Canada)'))
    end    
  end
end
