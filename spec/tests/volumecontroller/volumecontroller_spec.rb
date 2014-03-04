require 'spec_helper'

#
# cloud::volume::controller
#

describe service('cinder-api') do
  it { should be_enabled }
  it { should be_running }
end

describe port(8776) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/cinder/cinder.conf') do
  it { should contain 'glance_request_timeout=10' }
end

describe service('cinder-backup') do
  it { should be_enabled }
  it { should be_running }
end

describe service('cinder-scheduler') do
  it { should be_enabled }
  it { should be_running }
end

describe service('cinder-volume') do
  it { should be_enabled }
  it { should be_running }
end

#
# cloud::volume::storage
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "rbd_pool=volumes" }
  it { should contain "rdb_user=cinder" }
  it { should contain "glance_api_version=2" }
end

describe file('/etc/ceph/ceph.client.cinder.keyring') do
  it { should be_owned_by 'cinder' }
  it { should be_grouped_into 'cinder' }
  it { should be_mode 440 }
end

#
# cloud::volume
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "notification_driver=cinder.openstack.common.notifier.rpc_notifier" }
end
