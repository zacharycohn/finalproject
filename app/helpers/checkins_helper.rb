module CheckinsHelper

	# def setLabel(color)
	# 	labelType = if color == "green"
	# 		"label label-success"
	# 	elsif color == "yellow"
	# 		"label label-warning"
	# 	elsif color == "red"
	# 		"label label-danger"
	# 	end

	# 	"<div class=\"#{labelType}\">".html_safe
	# end

	def buildCheckinLink(color, id, last_id, checkinDate, updateMethod)

		labelType = if color == "green"
			"label label-success"
		elsif color == "yellow"
			"label label-warning"
		elsif color == "red"
			"label label-danger"
		end

		passBack = "<h3><div class=\"#{labelType}\">".html_safe
		if last_id.nil?
			passBack = passBack + link_to(color.capitalize, habit_checkins_path(status: color, habit_id: id, date: checkinDate), method: updateMethod) + "</span></h3>".html_safe

		else
			passBack = passBack + link_to(color.capitalize, habit_checkin_path(status: color, habit_id: id, id: last_id, date: checkinDate), method: updateMethod) + "</span></h3>".html_safe
		end

		passBack
	end

end
