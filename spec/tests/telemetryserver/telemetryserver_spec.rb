require 'spec_helper'

#
# cloud::telemetry::server
#

describe package('ceilometer-api') do
  it { should be_installed }
end

describe service('ceilometer-api') do
  it { should be_enabled }
  it { should be_running }
end

describe package('ceilometer-collector') do
  it { should be_installed }
end

describe service('ceilometer-collector') do
  it { should be_enabled }
  it { should be_running }
end

describe package('ceilometer-alarm-evaluator') do
  it { should be_installed }
end

describe service('ceilometer-alarm-evaluator') do
  it { should be_enabled }
  it { should be_running }
end

describe package('ceilometer-alarm-notifier') do
  it { should be_installed }
end

describe service('ceilometer-alarm-notifier') do
  it { should be_enabled }
  it { should be_running }
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

describe package('ceilometer-common') do
  it { should be_installed }
end
