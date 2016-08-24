module CheckinsHelper

	def setLabel color
		if color == "green"
			labelType = "label label-success"
		elsif color == "yellow"
			labelType = "label label-warning"
		elsif color == "red"
			labelType = "label label-danger"
		end

		"<div class=\"#{labelType}\">".html_safe
	end

	def buildPatchButton color, id, last_id, checkinDate

		"link_to \"#{color.capitalize}\", habit_checkin_path(status: \"#{color}\", habit_id: #{id}, id: #{last_id}, date: #{checkinDate}), method: 'PATCH'"
	end

end
