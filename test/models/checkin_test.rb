require 'test_helper'

class CheckinTest < ActiveSupport::TestCase

	# def setup
	# 	@user = User.create()
	# 	@habit = Habit.create(user: @user)
	# end
	
	test "#get_checkin_status success" do
		create_old_checkins("green")

		status = Checkin.get_checkin_status(Time.now)
		assert_equal "label label-success", status
	end

	test "#get_checkin_status warning" do
		create_old_checkins("yellow")

		status = Checkin.get_checkin_status(Time.now)
		assert_equal "label label-warning", status
	end

	test "#get_checkin_status danger" do
		create_old_checkins("red")

		status = Checkin.get_checkin_status(Time.now)
		assert_equal "label label-danger", status
	end

	test "#colorPicker" do

	end


private
	def create_old_checkins(status)
		@user = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @user)
		@habit2 = Habit.create(name: "Put shirt on", user: @user)

		@checkin1 = Checkin.create(habit: @habit1, status: status, date: Time.now)
		@checkin2 = Checkin.create(habit: @habit2, status: status, date: Time.now)

	end

end


   # t.integer  "habit_id"
   #  t.string   "status"
   #  t.string   "date"
   #  t.string   "description"