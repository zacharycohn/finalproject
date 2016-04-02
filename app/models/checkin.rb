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
		@startDay += str
	end

	def self.endDay
		@endDay
	end

	def self.endDay=(str)
		@endDay += str
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

	# def self.today
	# 	time = Time.new
	# 	where created_at: (Time.now - time.hour - time.min)..Time.now
	# end

	def to_s
		"empty"
	end
end
