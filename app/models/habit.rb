class Habit < ActiveRecord::Base
	#validates :name, :active , :user_id
	has_many :checkins
	belongs_to :user

	def self.active
		where active: "true"
	end

	def count_color(color)
		greens = self.checkins.where("status LIKE :term", term: "%#{color}%")
		return greens.size
	end

#covered by tests
	def checkin_ID(checkinDate)
		return self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").last.id
	end

#covered by tests
	def post_or_patch?(checkinDate)
		if !(self.checkins.empty?) and !(self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").empty?)
			#I want to patch
			return true 
		else
			#I want to post
			return false
		end
	end

	def getNumStatus(color)
		return self.checkins.where("status LIKE :term", term: "%#{color}%")
	end
end








