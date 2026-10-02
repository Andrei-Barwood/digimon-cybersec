require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep50_ladydevimon'

class Ep50Test < Minitest::Test
  def test_execution
    @traffic = DigiSec::DataTraffic.new; DigiSec::AngewomonCrypto.heavens_charm!(@traffic); assert_equal :cleared, @traffic.interceptor
  end
end
