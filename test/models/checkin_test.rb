# == Schema Information
#
# Table name: checkins
#
#  id          :integer          not null, primary key
#  habit_id    :integer
#  status      :string
#  date        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class CheckinTest < ActiveSupport::TestCase

	test "attribute accessors work" do
    c = Checkin.new
    c.startDay = 1
    c.endDay = 6
    c.checkinDay = 4

		assert_equal(1, c.startDay)
    assert_equal(6, c.endDay)
    assert_equal(4, c.checkinDay)
  end

	test "weird checkin bug" do
		habit = Habit.create(name: "Drink Water")
		checkin = Checkin.create(habit_id: habit.id, date: "2001-01-02", status: "green")

		assert_equal "2001-01-02", checkin.date

		checkin2 = Checkin.create(habit_id: habit.id, date: "2001-01-01", status: "red")

		assert_equal 2, Checkin.count

		assert_equal "green", checkin.status
		assert_equal "red", checkin2.status
		puts Checkin.all
	end

  test "default accessor values" do
    c = Checkin.new
    assert_equal(6, c.startDay)
  end
end
