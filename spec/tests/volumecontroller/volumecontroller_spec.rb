require 'spec_helper'

#
# cloud::volume::controller
#

describe port(8776) do
  it { should be_listening.with('tcp') }
end

describe file('/etc/cinder/cinder.conf') do
  it { should contain 'glance_request_timeout=10' }
end

#
# cloud::volume::storage
#

describe file('/etc/cinder/cinder.conf') do
  its(:content) { should match /^rbd_pool=volumes$/ }
  its(:content) { should match /^rbd_user=cinder$/ }
  its(:content) { should match /^volume_backend_name=ceph$/ }
end

describe file('/etc/ceph/ceph.client.cinder.keyring') do
  it { should be_grouped_into 'cephkeyring' }
  it { should be_mode 400 }
end

#
# cloud::volume
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "notification_driver=cinder.openstack.common.notifier.rpc_notifier" }
end
