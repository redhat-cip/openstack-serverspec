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

# when ceph is enabled, ensure we have the ceph keyring installed
rbd_enable = file('/etc/cinder/cinder.conf').contain("volume_driver\s*=\s*cinder.volume.drivers.rbd.RBDDriver",nil,nil)

describe file('/etc/ceph/ceph.client.cinder.keyring'), :if => rbd_enable do
  it { should be_file }
  it { should be_mode 440 }
  it { should be_owned_by 'root' }
  it { should be_grouped_into 'cephkeyring' }
end

#
# cloud::volume
#

describe file('/etc/cinder/cinder.conf') do
  it { should contain "notification_driver=cinder.openstack.common.notifier.rpc_notifier" }
end

describe command("timeout 10 cinder --os-username #{property[:ks_user_name]} --os-password #{property[:ks_user_password]} --os-tenant-name #{property[:ks_tenant_name]} --os-auth-url #{property[:endpoint_protocol]}://#{property[:vip_public]}:5000/v2.0 list") do
  it { should return_exit_status 0 }
end
