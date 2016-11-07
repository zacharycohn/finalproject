module StatsHelper


	def displayDays(c)
		message = "Day: " + c.date + " " + "Status: " + c.status	
		return message.html_safe
	end

end