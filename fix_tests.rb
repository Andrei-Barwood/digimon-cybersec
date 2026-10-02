episodes = [
  { num: 31, code: "@sys = DigiSec::TokyoBaySystem.new; DigiSec::RaremonCorruption.leak_memory!(@sys); assert_equal :corrupted_leak, @sys.memory_status; DigiSec::KabuterimonGC.collect_garbage!(@sys); assert_equal :clean, @sys.memory_status" },
  { num: 32, code: "@node = DigiSec::EighthChildNode.new; DigiSec::GatomonScanner.scan_internal!(@node); assert @node.discovered" },
  { num: 33, code: "@server = DigiSec::ShibuyaServer.new; DigiSec::MyotismonC2.purge_rogues!(@server); assert_empty @server.rogue_processes" },
  { num: 34, code: "@node = DigiSec::KariNode.new; DigiSec::WizardmonAuth.verify_identity!(@node, :crest_of_light); assert_equal :admin, @node.auth_level" },
  { num: 35, code: "@node = DigiSec::OdaibaNode.new; DigiSec::LillymonSandbox.pacify!(@node); assert_equal :quarantined_peacefully, @node.threat_status" },
  { num: 36, code: "@grid = DigiSec::TokyoGrid.new; DigiSec::PhantomonIsolator.isolate!(@grid); assert_equal :isolated_by_fog, @grid.connectivity" },
  { num: 37, code: "@proc = DigiSec::MyotismonProcess.new; DigiSec::AngewomonEngine.celestial_arrow!(@proc, 8); assert_equal :terminated, @proc.status" },
  { num: 38, code: "assert_equal :mega_evolution_unlocked, DigiSec::ProphecyAlgorithm.execute!(:shot_at_hope_and_light)" },
  { num: 39, code: "@core = DigiSec::VenomCore.new; DigiSec::MegaDefenders.destroy_core!(@core); assert_equal :destroyed, @core.status" },
  { num: 40, code: "@world = DigiSec::DigitalWorld.new; DigiSec::DarkMasters.reformat!(@world); assert_equal :spiral_mountain, @world.topology; assert_equal :safe_but_offline, DigiSec::PiximonBackup.stealth_escape!(nil)" },
  { num: 41, code: "@node = DigiSec::BeachNode.new; DigiSec::ScorpiomonSpoofer.trap!(@node); assert_equal :trapped_in_honeypot, @node.state; DigiSec::ZudomonRescue.break_out!(@node); assert_equal :free, @node.state" },
  { num: 42, code: "@proxy = DigiSec::WhamonProxy.new; assert_equal :enemy_defeated, DigiSec::WarGreymonExploit.brave_tornado!(nil, @proxy); assert_equal :destroyed, @proxy.status" },
  { num: 43, code: "@sess = DigiSec::TkSession.new; DigiSec::Puppetmon.rce!(@sess); assert_equal :puppetmon, @sess.controlled_by; DigiSec::TkSocialEngineering.reverse_hack!(@sess); assert_equal :self, @sess.controlled_by" },
  { num: 44, code: "@stack = DigiSec::MemoryStack.new; DigiSec::Garbagemon.overflow!(@stack); assert_equal :overflowed, @stack.capacity; DigiSec::LillymonSanitizer.sanitize!(@stack); assert_equal :normal, @stack.capacity" },
  { num: 45, code: "@clus = DigiSec::DefenderCluster.new; DigiSec::CherrymonLogicBomb.inject!(@clus); assert_equal :friendly_fire, @clus.status; DigiSec::KariEntity.resolve!(@clus); assert_equal :synchronized, @clus.status" },
  { num: 46, code: "@threat = DigiSec::EtemonThreat.new; @threat.resurrect!; assert_equal :metal_etemon_bootkit, @threat.state; assert_equal :escaped, DigiSec::SaberLeomonRescue.evade!(@threat)" },
  { num: 47, code: "@enemy = DigiSec::MetalEtemon.new; DigiSec::ZudomonHammer.break_armor!(@enemy); assert_equal :vulnerable, @enemy.armor" },
  { num: 48, code: "@tracker = DigiSec::NetworkTracker.new; DigiSec::IzzySpoofer.flood_logs!(@tracker); assert_equal :obfuscated, @tracker.tai_location" },
  { num: 49, code: "@enemy = DigiSec::MachinedramonAPT.new; DigiSec::WarGreymonBareMetal.dramon_destroyer!(@enemy); assert_equal :sliced_to_pieces, @enemy.status" },
  { num: 50, code: "@traffic = DigiSec::DataTraffic.new; DigiSec::AngewomonCrypto.heavens_charm!(@traffic); assert_equal :cleared, @traffic.interceptor" },
  { num: 51, code: "@node = DigiSec::DigiNode.new; DigiSec::PiedmonEncrypter.turn_to_keychain!(@node); assert_equal :encrypted_keychain, @node.state" },
  { num: 52, code: "@node = DigiSec::KeychainNode.new; @enemy = DigiSec::PiedmonEnemy.new; DigiSec::MagnaAngemon.restore_and_null_route!(@node, @enemy); assert_equal :active, @node.state; assert_equal :routed_to_null, @enemy.status" },
  { num: 53, code: "@sys = DigiSec::SystemData.new; DigiSec::Apocalymon.total_wipe!(@sys); assert_equal :deleted_binary_space, @sys.data; DigiSec::InternalEnclave.rebuild_from_memory!(@sys); assert_equal :restored_from_hearts, @sys.data" },
  { num: 54, code: "@world = DigiSec::FinalDigitalWorld.new; @bomb = DigiSec::ApocalymonBomb.new; DigiSec::DigiviceContainment.contain_blast!(@bomb, @world); assert_equal :rebooted_safely, @world.status" }
]

episodes.each do |ep|
  name = Dir["lib/digi_sec/ep#{ep[:num]}_*.rb"].first.split('/').last.gsub('.rb', '')
  test_content = <<~TEST
require 'minitest/autorun'
require_relative '../../lib/digi_sec/#{name}'

class Ep#{ep[:num]}Test < Minitest::Test
  def test_execution
    #{ep[:code]}
  end
end
  TEST
  File.write("test/episodios/ep#{ep[:num]}_test.rb", test_content)
end
