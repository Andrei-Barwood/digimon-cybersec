require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep51_piedmon'

class Ep51Test < Minitest::Test
  def test_execution
    @node = DigiSec::DigiNode.new; DigiSec::PiedmonEncrypter.turn_to_keychain!(@node); assert_equal :encrypted_keychain, @node.state
  end
end
