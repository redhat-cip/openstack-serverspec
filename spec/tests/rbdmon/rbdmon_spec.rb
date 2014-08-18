require 'spec_helper'

#################################
#
#         Ceph RBD mon
#
#################################

describe port(6789) do
  it { should be_listening.with('tcp') }
end

describe command('ceph -s') do
  its(:stdout) { should match /cluster/ }
end

describe command('ceph --admin-daemon /var/run/ceph/ceph-mon.*.asok mon_status') do
  its(:stdout) { should match /leader|peon/ }
end
