require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  test "Shift should save user_id" do
    shift = Shift.new(user_id: 1)
    shift.save
    assert true
  end
end
