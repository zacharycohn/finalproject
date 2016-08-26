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

  test "default accessor values" do
    c = Checkin.new
    assert_equal(6, c.startDay)
  end
end
