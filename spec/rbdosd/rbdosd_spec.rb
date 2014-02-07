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

describe command('ceph --admin-daemon $(ls /var/run/ceph/ceph-osd.*.asok|head -1) dump_historic_ops') do
  it { should return_exit_status 0 }
end

describe command('mount') do
  its(:stdout) { should match /\/var\/lib\/ceph\/osd\/ceph-. type xfs/ }
end

describe command('test -s "$(ls /var/lib/ceph/osd/ceph-*/fsid|head -1)"') do
  it { should return_exit_status 0 }
end

describe command('test -s "$(ls /var/lib/ceph/osd/ceph-*/ready|head -1)"') do
  it { should return_exit_status 0 }
end

describe command('test -s "$(ls /var/lib/ceph/osd/ceph-*/keyring|head -1)"') do
  it { should return_exit_status 0 }
end
