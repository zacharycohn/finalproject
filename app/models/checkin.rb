class Checkin < ActiveRecord::Base
	belongs_to :habit

	def self.query(term)
		self.where("habit_id LIKE :term OR status LIKE :term OR date LIKE :term", term: "%#{term}%")
	end
end
