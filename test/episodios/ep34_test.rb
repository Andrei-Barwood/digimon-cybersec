require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep34_wizardmongatomon'

class Ep34Test < Minitest::Test
  def test_execution
    @node = DigiSec::KariNode.new; DigiSec::WizardmonAuth.verify_identity!(@node, :crest_of_light); assert_equal :admin, @node.auth_level
  end
end
