class Habit < ActiveRecord::Base
	#validates :name, :active , :user_id
	has_many :checkins
	belongs_to :user

	def self.active
		where active: "true"
	end

	def check_in_ID(checkinDate)
		return self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").last.id
	end

	def post_or_patch?(checkinDate)
		#fix this vuln
		if !(self.checkins.empty?) and !(self.checkins.where(date: checkinDate).empty?) #self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").empty? # or 
			#I want to patch
			return true 
		else
			#I want to post
			return false
		end
	end
end








