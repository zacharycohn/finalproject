require 'test_helper'
include CheckinsHelper

class CheckinsHelperTest < ActiveSupport::TestCase

	test "#buildCheckinLabel" do
		create_old_checkins("red")

		realLink = buildCheckinLabel(@habit1, "red", (Time.now.strftime("%Y-%m-%d"))) #this breaks when it gets to habit_checkins_path... why?
		testLink = "<h3><div class=\"label label-danger\"><a rel=\"nofollow\" data-method=\"PATCH\" href=\"/habits/1/checkins/1?date=2016-09-24&amp;status=red\">Red</a></span></h3>"

		assert_equal testLink, realLink
	end

private
	def create_old_checkins(status)
		@user = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @user)

		@checkin1 = Checkin.create(habit: @habit1, status: status, date: Time.now.strftime("%Y-%m-%d"))
	end

end