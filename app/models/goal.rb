class Goal < ActiveRecord::Base
	belongs_to :user

	def self.get_monthly
		self.where("goal_type = 'monthly'")
	end

	def self.get_midterm
		self.where("goal_type = 'midterm'")
	end

	def self.get_longterm
		self.where("goal_type = 'longterm'")
	end

	def set_invisibleStatus(status)
		@vinisibleStatus = status
	end

end
