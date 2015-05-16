require 'test_helper'

class FeedzillaDownloaderStatisticTest < ActiveSupport::TestCase
  test "the truth" do
    v = FeedzillaDownloaderStatistic.all
    assert_equal 0, v.count
  end
end
