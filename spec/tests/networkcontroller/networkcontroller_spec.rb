require 'spec_helper'

# Neutron Server

describe file('/etc/neutron/plugins/ml2/ml2_conf.ini') do
  its(:content) { should match /^tunnel_types ?= ?gre$/ }
  its(:content) { should match /^type_drivers ?= ?gre,vlan,flat$/ }
  its(:content) { should match /^network_vlan_ranges = ?physnet1:1000:2999$/ }
  its(:content) { should match /^tunnel_id_ranges ?= ?1:10000$/ }
  its(:content) { should match /^mechanism_drivers ?= ?openvswitch,l2population$/ }
  its(:content) { should match /^l2_population ?= ?True$/ }
  its(:content) { should match /^polling_interval ?= ?15$/ }
  its(:content) { should match /^local_ip ?= ?#{property[:server_ip]}$/ }
  its(:content) { should match /^enable_tunneling ?= ?True$/ }
  its(:content) { should match /^integration_bridge ?= ?br-int$/ }
  its(:content) { should match /^bridge_mappings ?= ?public:br-pub$/ }
  its(:content) { should match /^firewall_driver ?= ?neutron.agent.linux.iptables_firewall.OVSHybridIptablesFirewallDriver$/ }
end

describe file('/etc/neutron/neutron.conf') do
  its(:content) { should match /^nova_admin_username ?= ?nova$/ }
end

describe port(9696) do
  it { should be_listening.with('tcp') }
end

describe command("neutron --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 net-list") do
  it { should return_exit_status 0 }
end
