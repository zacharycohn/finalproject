class Checkin < ActiveRecord::Base
	belongs_to :habit
	#why don't these work?
	attr_accessor :startDay, :endDay, :checkinDay

	@startDay = 6
	@endDay = 0
	@checkinDay = 0

	#probably don't need this
	def self.query(term)
		self.where("habit_id LIKE :term OR status LIKE :term OR date LIKE :term", term: "%#{term}%")
	end

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

		checkinByDate = self.where("date LIKE :term", term: "%#{str}%")
	end

#	def self.last_week
#		where created_at: (Time.now - 7.days)..Time.now
#	end

	def self.get_week
#		startOfWeek = @startDay + 1 
		#potential bug here. Will it grab something from one week ago but earlier in the day?
#		where created_at: (Time.now - startOfWeek.days)..(Time.now - @endDay.days)


		weekOfData = Array.new
 		x = 0
 
 		Checkin.endDay.upto(Checkin.startDay) do |d|
 			#refactor
 #			targetDate = (Time.now - d.days).strftime("%B %d %Y")
 #			weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last

 			targetDate = (Time.now.localtime - d.days).strftime("%Y-%m-%d")
 			weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last
 			x += 1
 		end
 		weekOfData

	end

	def self.last_checked_in_today?
		if self.getByDate(checkinDay).last.to_s.include? Time.now.strftime("%Y-%m-%d")
			true
		end
	end

	def self.get_checkin_status
		#this breaks if there isn't a full day's worth of checkins
		labelType = "label label-default"

		begin 
			if getByDate((Time.now - @checkinDay.days).strftime("%Y-%m-%d")).last.status == "green"
				labelType = "label label-success"
			elsif self.getByDate((Time.now - checkinDay.days).strftime("%Y-%m-%d")).last.status == "yellow"
				labelType = "label label-warning"
			elsif self.getByDate((Time.now - checkinDay.days).strftime("%Y-%m-%d")).last.status == "red"
				labelType = "label label-danger"
			end
		rescue

		end
#		getByDate((Time.now - @checkinDay.days).strftime("%Y-%m-%d")).last

		labelType
	end

	def to_s
		#"check checkin.to_s"
		self.date
	end
end
