require 'spec_helper'

#################################
#
#         Ceph RBD osd
#
#################################

describe service('ceph') do
  it { should be_enabled }
  it { should be_running }
end

describe port(6800) do
  it { should be_listening.with('tcp') }
end

describe port(6801) do
  it { should be_listening.with('tcp') }
end

describe port(6802) do
  it { should be_listening.with('tcp') }
end

describe port(6803) do
  it { should be_listening.with('tcp') }
end

describe port(6804) do
  it { should be_listening.with('tcp') }
end

describe command('ceph --admin-daemon /var/run/ceph/ceph-osd.0.asok dump_historic_ops') do
  it { should return_exit_status 0 }
end

describe command('mount') do
  its(:stdout) { should match /\/var\/lib\/ceph\/osd\/ceph-0 type xfs/ }
end
