module CheckinsHelper

	def buildLink(color, id, last_id, checkinDate, updateMethod)

		labelType = if color == "green"
			"label label-success"
		elsif color == "yellow"
			"label label-warning"
		elsif color == "red"
			"label label-danger"
		end

		labelLink = "<h3><div class=\"#{labelType}\">".html_safe
		if last_id.nil?
			labelLink = labelLink + link_to(color.capitalize, habit_checkins_path(status: color, habit_id: id, date: checkinDate), method: updateMethod) + "</span></h3>".html_safe
		else
			labelLink = labelLink + link_to(color.capitalize, habit_checkin_path(status: color, habit_id: id, id: last_id, date: checkinDate), method: updateMethod) + "</span></h3>".html_safe
		end

		labelLink
	end

	def colorPicker(checkinBlock)

		if checkinBlock.nil? == true
				color = "0000ff"
		else
			if checkinBlock.status == "green"
				color = "00cc00"
			elsif checkinBlock.status == "yellow"
				color= "ffff00"
			elsif checkinBlock.status == "red"
				color = "ff0000"
			end
		end
		return color
	end

	def buildCheckinLabel(habit, color, checkinDate)
		if habit.post_or_patch?(checkinDate)
			last_id = habit.check_in_ID(checkinDate)
			link = buildLink(color, habit.id, last_id, checkinDate, "PATCH")
		else
			link = buildLink(color, habit.id, nil, checkinDate, "POST")
		end

		return link
	end

	def flashNotice(notice)
		if notice == "green"
			flash = "<div class=\"alert alert-success\" role=\"alert\">Nice job! Keep it up.</div>".html_safe
		elsif notice == "yellow"
			flash = "<div class=\"alert alert-warning\" role=\"alert\">Ehh.. is that the best you can do?</div>".html_safe
		elsif notice == "red"
			flash = "<div class=\"alert alert-danger\" role=\"alert\">Oh come on. You gonna give up like that?</div>".html_safe
		end

		return flash
	end
end
