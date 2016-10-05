require 'test_helper'
include CheckinsHelper

class CheckinsHelperTest < ActionView::TestCase #< ActiveSupport::TestCase

	test "#buildCheckinLabel" do
		create_old_checkins("red")

		realPatchLink = buildCheckinLabel(@habit1, "red", (Time.new("2016", "09", "26").strftime("%Y-%m-%d")))
		testPatchLink = "<h3><div class=\"label label-danger\"><a rel=\"nofollow\" data-method=\"PATCH\" href=\"/habits/#{@habit1.id}/checkins/1?date=2016-09-26&amp;status=red\">Red</a></span></h3>"

		realPostLink = buildCheckinLabel(@habit1, "red", (Time.new("2016", "09", "27").strftime("%Y-%m-%d")))
		testPostLink = "<h3><div class=\"label label-danger\"><a rel=\"nofollow\" data-method=\"POST\" href=\"/habits/#{@habit1.id}/checkins?date=2016-09-27&amp;status=red\">Red</a></span></h3>"

		assert_equal testPatchLink, realPatchLink
		assert_equal testPostLink, realPostLink
	end

private
	def create_old_checkins(status)
		@user = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @user)

		@checkin1 = Checkin.create(habit: @habit1, status: status, date: Time.new("2016", "09", "26").strftime("%Y-%m-%d"))
	end

end