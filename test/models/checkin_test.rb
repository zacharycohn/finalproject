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

	test "#get_week" do
		create_old_checkins("red")

		weekOfData = Array.new
		weekOfTestData = Array.new
		weekOfRealData = @habit1.checkins.get_week
		weekOfTestData = [@checkin1, @checkin3, @checkin4, @checkin5, @checkin6, @checkin7, @checkin8]

		assert_equal weekOfTestData, weekOfRealData 

	end


 		# Checkin.endDay.upto(Checkin.startDay) do |d|
 		# 	targetDate = (Time.now.localtime - d.days).strftime("%Y-%m-%d")
 		# 	weekOfData[x] = self.where("date LIKE :term", term: "%#{targetDate}%").last
 		# 	x += 1
 		# end


private
	def create_old_checkins(status)
		@user = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @user)
		@habit2 = Habit.create(name: "Put shirt on", user: @user)

		@checkin1 = Checkin.create(habit: @habit1, status: status, date: Time.now)
		@checkin2 = Checkin.create(habit: @habit2, status: status, date: Time.now)
		@checkin3 = Checkin.create(habit: @habit1, status: "green", date: Time.now - 1.days)
		@checkin4 = Checkin.create(habit: @habit1, status: "yellow", date: Time.now - 2.days)
		@checkin5 = Checkin.create(habit: @habit1, status: "red", date: Time.now - 3.days)
		@checkin6 = Checkin.create(habit: @habit1, status: "green", date: Time.now - 4.days)
		@checkin7 = Checkin.create(habit: @habit1, status: "yellow", date: Time.now - 5.days)
		@checkin8 = Checkin.create(habit: @habit1, status: "red", date: Time.now - 6.days)
		@checkin9 = Checkin.create(habit: @habit1, status: "green", date: Time.now - 7.days)

	end

end


   # t.integer  "habit_id"
   #  t.string   "status"
   #  t.string   "date"
   #  t.string   "description"