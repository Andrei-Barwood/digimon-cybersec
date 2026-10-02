require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep43_puppetmon'

class Ep43Test < Minitest::Test
  def test_execution
    @sess = DigiSec::TkSession.new; DigiSec::Puppetmon.rce!(@sess); assert_equal :puppetmon, @sess.controlled_by; DigiSec::TkSocialEngineering.reverse_hack!(@sess); assert_equal :self, @sess.controlled_by
  end
end
