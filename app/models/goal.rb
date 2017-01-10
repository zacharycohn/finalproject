class Goal < ActiveRecord::Base
	belongs_to :user

	def self.getMonthly
		monthlyFocus = self.where("type LIKE monthly")
	end

	def self.getMidTerm
		midTerm = self.where("type LIKE midterm")
	end

	def self.getLongTerm
		longTerm = self.where("type LIKE longterm")
	end

	def getType
		return self.type
	end

	def getStatus
		return @status
	end


end
