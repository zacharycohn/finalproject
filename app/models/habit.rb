class Habit < ActiveRecord::Base
	#validates :name, :active , :user_id
	has_many :checkins

	def self.query(term)
		self.where("name LIKE :term OR active LIKE :term OR user_id LIKE :term", term: "%#{term}%")
	end

	def self.active
		where active: "true"
	end
end
