class Goal < ActiveRecord::Base
	belongs_to :user

	def self.getMonthly
		self.where("goal_type = 'monthly'")
	end

	def self.getMidTerm
		self.where("goal_type = 'midterm'")
	end

	def self.getLongTerm
		self.where("goal_type = 'longterm'")
	end

end
