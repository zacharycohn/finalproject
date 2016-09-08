# == Schema Information
#
# Table name: habits
#
#  id         :integer          not null, primary key
#  name       :string
#  active     :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class HabitTest < ActiveSupport::TestCase
  test "Habit creation returns a Habit" do
    h = Habit.create()
    assert_instance_of(Habit, h)
  end


end
