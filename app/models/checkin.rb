class Checkin < ActiveRecord::Base
	belongs_to :habit
	attr_accessor :startDay, :endDay

	@startDay = 6
	@endDay = 0

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

	# def self.green
	# 	where status: "green"
	# end

	# def self.yellow
	# 	where status: "yellow"
	# end
	
	# def self.red
	# 	where status: "red"
	# end

	def self.last_week
		where created_at: (Time.now - 7.days)..Time.now
	end

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

 			targetDate = (Time.now - d.days).strftime("%Y-%m-%d")
 			weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last
 			x += 1
 		end
 		weekOfData

	end

	# def self.today
	# 	time = Time.new
	# 	where created_at: (Time.now - time.hour - time.min)..Time.now
	# end

	def to_s
		"empty"
	end
end
