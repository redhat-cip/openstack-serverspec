require 'spec_helper'

####################################
#
#         OpenStack Network services
#
####################################

describe kernel_module('openvswitch') do
  it { should be_loaded }
end

describe command('lsmod | grep -q gre') do
    it { should return_exit_status 0 }
end

describe command('ovs-vsctl show | grep -q br-int') do
    it { should return_exit_status 0 }
end
