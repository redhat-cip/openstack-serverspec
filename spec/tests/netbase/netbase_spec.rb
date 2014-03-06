require 'spec_helper'

####################################
#
#         OpenStack Network services
#
####################################

describe kernel_module('openvswitch') do
  it { should be_loaded }
end

describe kernel_module('gre') do
  it { should be_loaded }
end

describe kernel_module('vxlan') do
  it { should be_loaded }
end

describe package('openvswitch-switch') do
  it { should be_installed }
end

describe service('openvswitch-switch') do
  it { should be_enabled }
  it { should be_running }
end

describe package('neutron-plugin-openvswitch-agent') do
  it { should be_installed }
end

describe service('neutron-plugin-openvswitch-agent') do
  it { should be_enabled }
  it { should be_running }
end

describe command('ovs-vsctl show | grep br-int') do
    it { should return_exit_status 0 }
end
