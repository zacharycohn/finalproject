require 'test_helper'

class HabitTest < ActiveSupport::TestCase
	test "#countColor" do 
		create_old_checkins

		countGreens = @habit1.count_color("green")
		countYellows = @habit1.count_color("yellow")
		countReds = @habit2.count_color("red")

		assert_equal 1, countGreens
		assert_equal 7, countYellows
		assert_equal 0, countReds
	end

  test "#post_or_patch?" do
  	create_old_checkins
  	test1 = @habit1.post_or_patch?(@testingDate)
  	test2 = @habit1.post_or_patch?(@testingDate - 50.days)
  	test3 = @habit2.post_or_patch?(@testingDate)

  	assert_equal true, test1
  	assert_equal false, test2
  	assert_equal false, test3
	end

	#wtf were we doing here?
	test "#checkin_ID" do
		create_old_checkins
		last_id = @habit1.checkin_ID(@testingDate)

		assert_equal 1, last_id
	end

private
	def create_old_checkins

		@testingDate = Date.new(2017,02,18) 

		@u = User.create()

		@habit1 = Habit.create(name: "Put pants on", user: @u)
		@habit2 = Habit.create(name: "Take pants off", user: @u)

		@checkin1 = Checkin.create(habit: @habit1, status: "green", date: @testingDate)

		#	habit_id: habits(:pants).id, date: checkin_date, status: "red", id: habits(:pants).checkins.last.id
# =>													 status: habit_id: id: date:), method:

#real bug here

		@checkin1.update(habit_id: @habit1.id, status: "yellow", date: @testingDate, id: @habit1.checkins.last.id) #i think this is creating a new checkin, not updating
		@checkin3 = Checkin.create(habit: @habit1, status: "green", date: @testingDate - 1.days)

		@checkin11 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 2.days)	
		@checkin4 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 3.days)
		@checkin5 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 4.days)
		@checkin6 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 5.days)
		@checkin7 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 6.days)
		@checkin8 = Checkin.create(habit: @habit1, status: "yellow", date: @testingDate - 7.days)

#		@checkin9 = Checkin.create(habit: @habit1, status: "red", date: Time.now - 3.days)
#		@checkin10 = Checkin.create(habit: @habit1, status: "red", date: Time.now - 5.days)


	end
end
