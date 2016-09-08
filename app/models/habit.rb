# == Schema Information
#
# Table name: habits
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

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

	def self.last_checked_in_today?
		self.checkins.where(date: Date.today.strftime("%Y-%m-%d"))

		if self.getByDate(checkinDay).last.to_s.include? Time.now.strftime("%Y-%m-%d")
			true
		end
	end
end
