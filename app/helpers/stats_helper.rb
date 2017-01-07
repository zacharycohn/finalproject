module StatsHelper


	def displayDays(c)
		message = "Day: " + c.date + " " + "Status: " + c.status	
		return message.html_safe
	end

	def successRate
		total = @stats.count_color("green") + @stats.count_color("yellow") + @stats.count_color("red")
		rate = @stats.count_color("green") * 100 / total
		return rate
	end


end