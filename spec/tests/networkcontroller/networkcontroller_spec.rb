require 'spec_helper'

# Neutron Server

describe file('/etc/neutron/plugins/ml2/ml2_conf.ini') do
  # does this do anything?
  #its(:content) { should match /^tunnel_types ?= ?gre$/ }
  its(:content) { should match /^type_drivers ?= ?#{property[:ml2_type_drivers]}$/ }
  if property[:ml2_type_drivers].split(',').include?('vlan')
    its(:content) { should match /^network_vlan_ranges = ?#{property[:network_vlan_ranges]}$/ }
  end
  if property[:ml2_type_drivers].split(',').include?('gre')
    its(:content) { should match /^tunnel_id_ranges ?= ?#{property[:tunnel_id_ranges]}$/ }
  end
  its(:content) { should match /^mechanism_drivers ?= ?#{property[:ml2_mechanism_drivers]}$/ }
  if property[:ml2_mechanism_drivers].split(',').include?('l2population')
    its(:content) { should match /^l2_population ?= ?True$/ }
  end
  its(:content) { should match /^polling_interval ?= ?#{property[:ml2_agent_polling_interval]}$/ }
  its(:content) { should match /^local_ip ?= ?#{property[:gre_local_ip]}$/ }
  its(:content) { should match /^enable_tunneling ?= ?True$/ }
  its(:content) { should match /^integration_bridge ?= ?br-int$/ }
  its(:content) { should match /^bridge_mappings ?= ?#{property[:bridge_mappings]}$/ }
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
