class Checkin < ActiveRecord::Base
	belongs_to :habit
	#why don't these work?
#	attr_accessor :startDay, :endDay, :checkinDay

	# @startDay = 6
	# @endDay = 0
	# @checkinDay = 0

	@checkinDate = Time.now


	def self.checkinDate
		@checkinDate
	end

	def self.checkinDate=(str)
		@checkinDate = str
	end

	###much of the stuff below here will be deletable###
	# def self.startDay
	# 	@startDay
	# end

	# def self.startDay=(str)
	# 	@startDay = str
	# end

	# def self.endDay
	# 	@endDay
	# end

	# def self.endDay=(str)
	# 	@endDay = str
	# end

	# def self.checkinDay
	# 	@checkinDay
	# end

	# def self.checkinDay=(str)
	# 	@checkinDay = str
	# end

	# def self.jumpToToday=(str)
	# 	@checkinDate = str
	# end

	#########


	def self.getByDate(str)
		checkinByDate = Array.new

		checkinByDate = self.where("date LIKE :term", term: "%#{str}%").last
	end

#covered by tests
	def self.get_week
		weekOfData = Array.new
 		x = 0

 		0.upto(6) do |d|
 			targetDate = (@checkinDate - d.days).strftime("%Y-%m-%d")
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
