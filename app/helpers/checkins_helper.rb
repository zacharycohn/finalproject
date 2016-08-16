module CheckinsHelper

	def setLabel color
		if color == "green"
			labelType = "label label-success"
		end

		"<div class=\"" + labelType + "\">"
	end

	def buildButton color
		"<%= link_to \"" + color.capitalize + "\", habit_checkin_path(status: \"" + color + "\", habit_id: h.id, id: last_id, date: checkinDate), method: \'PATCH\' %>"
	end

end
