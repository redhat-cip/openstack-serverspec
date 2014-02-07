require 'spec_helper'

#################################
#
#         Ceph RBD mon
#
#################################

describe service('ceph') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6789) do
  it { should be_listening.with('tcp') }
end

describe command('ceph -s') do
  its(:stdout) { should match /cluster/ }
end

describe command('ceph --admin-daemon /var/run/ceph/ceph-mon.*.asok mon_status') do
  its(:stdout) { should match /leader|peon/ }
end

# Check defaults RBD pools

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'data'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'rbd'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'metadata'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'volumes'/ }
end

describe command('ceph osd dump') do
  its(:stdout) { should match /pool . 'images'/ }
end
