require 'test_helper'

class CheckinsControllerTest < ActionController::TestCase
  include Devise::TestHelpers

  test "create a Checkin" do
  	sign_in(users(:ralph))

  	assert_difference 'Checkin.count', 1 do
	    post :create, habit_id: habits(:pants).id, date: Time.now, status: "green"
		end

		@checkin = Checkin.last
		assert_equal "green", @checkin.status
	end



	test "update a Checkin" do 
		sign_in(users(:ralph))
		
		checkin_date = (Time.now - 5.days).strftime("%Y-%m-%d")
		post :create, habit_id: habits(:pants).id, date: checkin_date, status: "green"
		assert_redirected_to "/habits/today"

		@checkin = Checkin.last
		assert_equal "green", @checkin.status

		patch :update, habit_id: habits(:pants).id, date: checkin_date, status: "red", id: habits(:pants).checkins.last.id
		assert_redirected_to "/habits/today"

		@checkin.reload

		assert_equal checkin_date, @checkin.date
		assert_equal "updated", assigns[:checkin].description  # to test variables from controller
		assert_equal "red", @checkin.status
		assert_equal "red", flash[:notice]
	end
end

