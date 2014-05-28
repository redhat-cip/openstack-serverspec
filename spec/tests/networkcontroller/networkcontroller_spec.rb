require 'spec_helper'

# Neutron Server

describe file('/etc/neutron/plugins/ml2/ml2_conf.ini') do
  its(:content) { should match /^tunnel_types ?= ?gre$/ }
  its(:content) { should match /^type_drivers ?= ?gre,vlan$/ }
  its(:content) { should match /^network_vlan_ranges = ?physnet1:1000:2999$/ }
  its(:content) { should match /^tunnel_id_ranges ?= ?1:10000$/ }
  its(:content) { should match /^mechanism_drivers ?= ?openvswitch,l2population$/ }
  its(:content) { should match /^l2_population ?= ?True$/ }
  its(:content) { should match /^polling_interval ?= ?15$/ }
  its(:content) { should match /^local_ip ?= ?#{property[:server_ip]}$/ }
  its(:content) { should match /^enable_tunneling ?= ?True$/ }
  its(:content) { should match /^integration_bridge ?= ?br-int$/ }
  its(:content) { should match /^bridge_mappings ?= ?physnet1:br-eth1$/ }
  its(:content) { should match /^firewall_driver ?= ?neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver$/ }
end

describe file('/etc/neutron/neutron.conf') do
  it { should contain "nova_admin_username =nova" }
end

describe port(9696) do
  it { should be_listening.with('tcp') }
end
