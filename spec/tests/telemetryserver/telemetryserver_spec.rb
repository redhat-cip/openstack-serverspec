require 'spec_helper'

#
# cloud::telemetry::server
#

describe port(8777) do
  it { should be_listening.with('tcp') }
end

describe user('ceilometer') do
  it { should exist }
  it { should belong_to_group 'ceilometer' }
end

describe group('ceilometer') do
  it { should exist }
end

describe file('/etc/ceilometer') do
  it { should be_directory }
  it { should be_mode 750 }
  it { should be_owned_by 'ceilometer' }
  it { should be_grouped_into 'ceilometer' }
end

describe file('/etc/ceilometer/ceilometer.conf') do
  it { should be_file }
  it { should be_mode 640 }
  it { should be_owned_by 'ceilometer' }
  it { should be_grouped_into 'ceilometer' }
  its(:content) { should match /^rpc_backend=ceilometer.openstack.common.rpc.impl_kombu$/ }
  its(:content) { should match /^notification_topics=notifications$/ }
  its(:content) { should match /^use_syslog=True$/ }
  its(:content) { should match /^syslog_log_facility=LOG_LOCAL0$/ }
end

describe command("mongo \"#{property[:server_ip]}\":27017/ceilometer " \
                 "--eval \"assert(db.isMaster().ismaster " \
                 "? db.system.indexes.find({ ns: 'ceilometer.resource' }).length() == 2 " \
                 ": true)\"") do
  it { should return_exit_status 0 }
end
