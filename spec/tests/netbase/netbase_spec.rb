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

describe command('ovs-vsctl show | grep br-int') do
    it { should return_exit_status 0 }
end
