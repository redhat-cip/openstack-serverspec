require 'spec_helper'

#
# cloud::telemetry::server
#

describe user('ceilometer') do
  it { should exist }
  it { should belong_to_group 'ceilometer' }
end

describe group('ceilometer') do
  it { should exist }
end

describe file('/etc/ceilometer') do
  it { should be_directory }
  it { should be_mode 0750 }
  it { should be_owned_by 'ceilometer' }
  it { should be_grouped_into 'ceilometer' }
end

describe file('/etc/ceilometer/ceilometer.conf') do
  it { should be_file }
  it { should be_mode 0640 }
  it { should be_owned_by 'ceilometer' }
  it { should be_grouped_into 'ceilometer' }
  it { should contain 'rpc_backend=ceilometer.openstack.common.rpc.impl_kombu' }
  it { should contain 'log_dir=/var/log/ceilometer' }
  it { should contain 'glance_control_exchange=glance' }
  it { should contain 'notification_topics=notifications' }
  it { should contain 'use_syslog=true' }
  it { should contain 'syslog_log_facility=LOG_USER' }
end

describe package('ceilometer-common') do
  it { should be_installed }
end
