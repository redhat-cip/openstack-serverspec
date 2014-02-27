require 'spec_helper'

####################################
#
#         OpenStack Network services
#
####################################

describe service('openvswitch-switch') do
  it { should be_enabled }
  it { should be_running }
end

describe command('ovs-vsctl show | grep br-int') do
    it { should return_exit_status 0 }
end
