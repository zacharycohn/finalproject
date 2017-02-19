require 'test_helper'

class CheckinsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "create a Checkin" do
  	sign_in(users(:ralph))

  	checkinTime = setDate() 
  	assert_difference 'Checkin.count', 1 do
	    post :create, habit_id: habits(:pants).id, date: checkinTime, status: "green"
		end

		assert_redirected_to "/habits/2017/2/18"

		@checkin = Checkin.last
		assert_equal "green", @checkin.status
		assert_equal "#{checkinTime}", @checkin.date.to_formatted_s
		assert_equal "green", flash[:notice]

	end



	test "update a Checkin" do
		sign_in(users(:ralph))
		
		checkin_date = setDate() - 5.days
		post :create, habit_id: habits(:pants).id, date: checkin_date, status: "green"
		assert_redirected_to "/habits/2017/2/13"

		@checkin = Checkin.last
		assert_equal "green", @checkin.status

		patch :update, habit_id: habits(:pants).id, date: checkin_date, status: "red", id: habits(:pants).checkins.last.id
		assert_redirected_to "/habits/2017/2/13"

		@checkin.reload

		assert_equal checkin_date.to_formatted_s(:db), @checkin.date.to_formatted_s
		assert_equal "updated", assigns[:checkin].description  # to test variables from controller
		assert_equal "red", @checkin.status
		assert_equal "red", flash[:notice]
	end

private
	def setDate
		@currentDate = Date.new(2017,02,18) 
	end
end

