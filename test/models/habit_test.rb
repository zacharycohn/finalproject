require 'test_helper'

class HabitTest < ActiveSupport::TestCase
  test "Habit creation returns a Habit" do
    h = Habit.create()
    assert_instance_of(Habit, h)
  end


end
