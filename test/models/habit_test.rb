require 'test_helper'

class HabitTest < ActiveSupport::TestCase

  test "#post_or_patch?" do
  	create_old_checkins
  	test1 = @habit1.post_or_patch?(Time.now)
  	test2 = @habit1.post_or_patch?(Time.now - 1.days)
  	test3 = @habit2.post_or_patch?(Time.now)

  	assert_equal true, test1
  	assert_equal false, test2
  	assert_equal false, test3
	end

	test "#checkin_ID" do
		create_old_checkins
		last_id = @habit1.checkin_ID(Time.now)

		assert_equal 2, last_id
	end

private
	def create_old_checkins
		@u = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @u)
		@habit2 = Habit.create(name: "Take pants off", user: @u)

		@checkin1 = Checkin.create(habit: @habit1, status: "green", date: Time.now)
		@checkin2 = Checkin.create(habit: @habit1, status: "yellow", date: Time.now)
	end
end
