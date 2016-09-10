class Habit < ActiveRecord::Base
	#validates :name, :active , :user_id
	has_many :checkins
	belongs_to :user

	def self.active
		where active: "true"
	end

# 	def checked_in_on?(checkinDate)
# #		if self.checkins.where(date: checkinDate).empty?
# 		if self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").empty?	
# 			return true
# 		else
# 			return false
# 		end
# 	end

	def post_or_patch(checkinDate)
		#fix this vuln
		if !(self.checkins.empty?) and !(self.checkins.where(date: checkinDate).empty?) #self.checkins.where("date LIKE :term", term: "%#{checkinDate}%").empty? # or 
			#I want to patch
			return "patch" 
		else
			#I want to post
			return "post" 
		end
	end
end








