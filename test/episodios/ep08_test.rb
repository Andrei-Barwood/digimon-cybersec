require 'minitest/autorun'
require_relative '../../lib/digi_sec/ep08_devimon'

class Ep08Test < Minitest::Test
  def setup
    @nodes = [
      DigiSec::DefenseNode.new("Tai_Node"),
      DigiSec::DefenseNode.new("Matt_Node"),
      DigiSec::DefenseNode.new("Sora_Node"),
      DigiSec::DefenseNode.new("Izzy_Node"),
      DigiSec::DefenseNode.new("Mimi_Node"),
      DigiSec::DefenseNode.new("Joe_Node"),
      DigiSec::DefenseNode.new("TK_Node")
    ]
    @cluster = DigiSec::SocCluster.new(@nodes)
  end

  def test_initial_cluster_state
    # Todos están en la misma red
    assert_equal 1, @cluster.subnets.keys.length
    assert_equal :master_subnet, @cluster.subnets.keys.first
    assert_equal 7, @cluster.subnets[:master_subnet].length
  end

  def test_devimon_apt_partitions_network_but_nodes_survive
    # Ataque de Devimon
    DigiSec::DevimonAPT.partition_network!(@cluster)
    
    # La red ha sido segmentada maliciosamente
    assert_equal 7, @cluster.subnets.keys.length
    refute_includes @cluster.subnets.keys, :master_subnet
    
    # Cada subred tiene exactamente 1 nodo (aislamiento)
    @cluster.subnets.each_value do |subnet_nodes|
      assert_equal 1, subnet_nodes.length
    end
    
    # Mitigación / Supervivencia: Los nodos mantienen su estado distribuido
    # Ningún nodo pasó a :destroyed
    @cluster.all_nodes.each do |node|
      assert_equal :alive, node.status
    end
  end
end
