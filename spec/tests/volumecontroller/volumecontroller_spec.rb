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
  if property[:cinder_backend] == 'rbd'
    its(:content) { should match /^rbd_pool=volumes$/ }
    its(:content) { should match /^rbd_user=cinder$/ }
    its(:content) { should match /^volume_backend_name=ceph$/ }
  elsif property[:cinder_backend] == :iscsi
    its(:content) { should match /^iscsi_helper = tgtadm$/ }
  end
end

if property[:cinder_backend] == 'rbd'
  describe file('/etc/ceph/ceph.client.cinder.keyring') do
    it { should be_grouped_into 'cephkeyring' }
    it { should be_mode 440 }
  end
end

#
# cloud::volume
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "notification_driver=cinder.openstack.common.notifier.rpc_notifier" }
end

describe command("cinder --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_proto]}://#{property[:vip_public]}:5000/v2.0 list") do
  it { should return_exit_status 0 }
end
