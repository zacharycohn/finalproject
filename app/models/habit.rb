class Habit < ActiveRecord::Base
	#validates :name, :active , :user_id
	has_many :checkins
	belongs_to :user

	# def self.query(term)
	# 	self.where("name LIKE :term OR active LIKE :term OR user_id LIKE :term", term: "%#{term}%")
	# end

	def self.active
		where active: "true"
	end

	def last_checked_in_today?(checkinDate)
		#if this works, rewrite to not be a vuln
		if self.checkins.where(date: checkinDate).empty?
			set = false
		else
			set = true
		end

		return set
	end

end
