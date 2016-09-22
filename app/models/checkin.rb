class Checkin < ActiveRecord::Base
	belongs_to :habit
	#why don't these work?
	attr_accessor :startDay, :endDay, :checkinDay

	@startDay = 6
	@endDay = 0
	@checkinDay = 0

	def self.startDay
		@startDay
	end

	def self.startDay=(str)
		@startDay = str
	end

	def self.endDay
		@endDay
	end

	def self.endDay=(str)
		@endDay = str
	end

	def self.checkinDay
		@checkinDay
	end

	def self.checkinDay=(str)
		@checkinDay = str
	end

	def self.jumpToToday=(str)
		@checkinDay = str
	end

	def self.getByDate(str)
		checkinByDate = Array.new

		checkinByDate = self.where("date LIKE :term", term: "%#{str}%").last
	end

	def self.get_week
		weekOfData = Array.new
 		x = 0
 
 		Checkin.endDay.upto(Checkin.startDay) do |d|
 			targetDate = (Time.now.localtime - d.days).strftime("%Y-%m-%d")
 			weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last
 			x += 1
 		end
 		weekOfData

	end

	#covered by tests
	def self.get_checkin_status
		labelType = "label label-default"

		begin 
			if getByDate((Time.now - @checkinDay.days).strftime("%Y-%m-%d")).status == "green"
				labelType = "label label-success"
			elsif getByDate((Time.now - checkinDay.days).strftime("%Y-%m-%d")).status == "yellow"
				labelType = "label label-warning"
			elsif getByDate((Time.now - checkinDay.days).strftime("%Y-%m-%d")).status == "red"
				labelType = "label label-danger"
			end
		rescue
			#use default label type
		end

		labelType
	end

	def to_s
		self.date
	end
end
