require "test_helper"

class LineItemDateTest < ActiveSupport::TestCase
  test "#previous_date returns the previous date when it exists " do
    assert_equal line_item_dates(:today), line_item_dates(:next_week).previous_date
  end
end
