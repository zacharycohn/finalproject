require 'test_helper'

class CheckinTest < ActiveSupport::TestCase
	
	test "#get_checkin_status success" do
		create_old_checkins("green")

		status = Checkin.get_checkin_status(@testingDate)
		assert_equal "label label-success", status
	end

	test "#get_checkin_status warning" do
		create_old_checkins("yellow")

		status = Checkin.get_checkin_status(@testingDate)
		assert_equal "label label-warning", status
	end

	test "#get_checkin_status danger" do
		create_old_checkins("red")

		status = Checkin.get_checkin_status(@testingDate)
		assert_equal "label label-danger", status
	end

	test "#get_week" do
		create_old_checkins("red")

		weekOfData = Array.new
		weekOfTestData = Array.new
		weekOfRealData = @habit1.checkins.get_week(@testingDate)
		weekOfTestData = [@checkin1, @checkin3, @checkin4, @checkin5, @checkin6, @checkin7, @checkin8]

		assert_equal weekOfTestData, weekOfRealData 

	end

	test "#getByDate" do
		create_dupe_checkins

		assert_equal @checkin11, @habit3.checkins.getByDate(@testingDate - 4.days)

	end

private

	def create_old_checkins(status)

		setDate()
		@user = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @user)
		@habit2 = Habit.create(name: "Put shirt on", user: @user)

		@checkin1 = Checkin.create(habit: @habit1, status: status, date: @testingDate.strftime("%Y-%m-%d"))
		@checkin2 = Checkin.create(habit: @habit2, status: status, date: @testingDate)
		@checkin3 = Checkin.create(habit: @habit1, status: "green", date: @testingDate - 1.days)
		@checkin4 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 2.days)
		@checkin5 = Checkin.create(habit: @habit1, status: "red", date: @testingDate - 3.days)
		@checkin6 = Checkin.create(habit: @habit1, status: "green", date: @testingDate - 4.days)
		@checkin7 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 5.days)
		@checkin8 = Checkin.create(habit: @habit1, status: "red", date: @testingDate - 6.days)
		@checkin9 = Checkin.create(habit: @habit1, status: "green", date: @testingDate - 7.days)
	end

	def create_dupe_checkins
		setDate()
		@user2 = User.create()

		@habit3 = Habit.create(name: "Pants", user: @user2)

		@checkin10 = Checkin.create(habit: @habit3, status: "green", date: @testingDate - 4.days)
		@checkin11 = Checkin.create(habit: @habit3, status: "red", date: @testingDate - 4.days)

	end

	def setDate
		@testingDate = Date.new(2017,02,19)
	end

end