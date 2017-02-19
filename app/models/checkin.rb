class Checkin < ActiveRecord::Base
	belongs_to :habit

#covered by tests
	def self.getByDate(str)
		checkinByDate = Array.new
		
		checkinByDate = self.where("date LIKE :term", term: "%#{str}%").last
		return checkinByDate
	end

#covered by tests
	def self.get_week(checkinWeek)
		weekOfData = Array.new
 		x = 0

 		0.upto(6) do |d|
 			targetDate = (checkinWeek - d.days).strftime("%Y-%m-%d")
 			weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last
 			x += 1
 		end
 		weekOfData

	end

	#covered by tests
	def self.get_checkin_status(checkinDate)
		labelType = "label label-default"

		begin 
			if getByDate(checkinDate).status == "green"
				labelType = "label label-success"
			elsif getByDate(checkinDate).status == "yellow"
				labelType = "label label-warning"
			elsif getByDate(checkinDate).status == "red"
				labelType = "label label-danger"
			end
		rescue
			#uses default label type
		end

		labelType
	end

	def to_s
		self.date
	end

end
